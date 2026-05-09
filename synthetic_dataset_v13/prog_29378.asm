; DESCRIPTION: Composite: Draws a blue circle centered at (314, 157) with radius 64 then Places a magenta dot at position (172, 38).
; PLAN: r0=314(x), r1=157(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=38(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 157
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 38
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT

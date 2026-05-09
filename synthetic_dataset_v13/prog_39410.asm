; DESCRIPTION: Composite: Creates a magenta circular shape at (271, 186) with radius 32 then Places a blue dot at position (85, 101).
; PLAN: r0=271(x), r1=186(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=101(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 186
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 101
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

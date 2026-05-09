; DESCRIPTION: Composite: Draws a magenta circle centered at (186, 167) with radius 63 then Places a purple dot at position (326, 223).
; PLAN: r0=186(x), r1=167(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=223(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 167
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 223
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT

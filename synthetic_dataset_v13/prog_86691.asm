; DESCRIPTION: Composite: Draws a purple circle centered at (253, 142) with radius 40 then Places a green dot at position (423, 88).
; PLAN: r0=253(x), r1=142(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 142
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

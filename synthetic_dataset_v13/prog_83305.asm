; DESCRIPTION: Composite: Draws a green circle centered at (70, 71) with radius 65 then Places a blue dot at position (402, 90).
; PLAN: r0=70(x), r1=71(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=90(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 70
LDI r1, 71
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 90
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

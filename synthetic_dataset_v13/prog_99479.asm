; DESCRIPTION: Composite: Places a blue line segment connecting (318, 188) to (257, 57) then Draws a green circle centered at (375, 193) with radius 11.
; PLAN: r0=318(x1), r1=188(y1), r2=257(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=193(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 188
LDI r2, 257
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 193
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Renders a blue line between points (498, 248) and (334, 197) then Draws a yellow circle centered at (181, 170) with radius 20.
; PLAN: r0=498(x1), r1=248(y1), r2=334(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=170(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 498
LDI r1, 248
LDI r2, 334
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 170
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

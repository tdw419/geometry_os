; DESCRIPTION: Composite: Places a green circle of radius 63 at center (109, 84) then Places a black line segment connecting (158, 218) to (448, 153).
; PLAN: r0=109(x), r1=84(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x1), r6=218(y1), r7=448(x2), r8=153(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 84
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 218
LDI r7, 448
LDI r8, 153
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

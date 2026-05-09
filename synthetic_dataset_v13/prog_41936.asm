; DESCRIPTION: Composite: Renders a green disk with center (334, 187) and radius 68 then Places a black line segment connecting (84, 183) to (192, 240).
; PLAN: r0=334(x), r1=187(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x1), r6=183(y1), r7=192(x2), r8=240(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 187
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 183
LDI r7, 192
LDI r8, 240
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

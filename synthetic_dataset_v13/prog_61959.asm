; DESCRIPTION: Composite: Places a white line segment connecting (338, 216) to (133, 57) then Renders a green disk with center (263, 158) and radius 22.
; PLAN: r0=338(x1), r1=216(y1), r2=133(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=158(y), r7=22(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 338
LDI r1, 216
LDI r2, 133
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 158
LDI r7, 22
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

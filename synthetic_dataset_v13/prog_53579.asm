; DESCRIPTION: Composite: Renders a blue disk with center (85, 159) and radius 20 then Renders a blue line between points (398, 255) and (81, 99).
; PLAN: r0=85(x), r1=159(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x1), r6=255(y1), r7=81(x2), r8=99(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 159
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 255
LDI r7, 81
LDI r8, 99
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT

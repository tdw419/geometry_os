; DESCRIPTION: Composite: Draws a green line from (363, 150) to (169, 84) then Renders a purple disk with center (100, 180) and radius 54.
; PLAN: r0=363(x1), r1=150(y1), r2=169(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=180(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 150
LDI r2, 169
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 180
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

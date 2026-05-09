; DESCRIPTION: Renders a red line between points (219, 216) and (454, 4).
; PLAN: r0=219(x1), r1=216(y1), r2=454(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 216
LDI r2, 454
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

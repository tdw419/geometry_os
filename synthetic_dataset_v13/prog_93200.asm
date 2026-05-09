; DESCRIPTION: Renders a black line between points (489, 20) and (430, 98).
; PLAN: r0=489(x1), r1=20(y1), r2=430(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 20
LDI r2, 430
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

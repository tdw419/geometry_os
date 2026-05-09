; DESCRIPTION: Renders a black line between points (324, 54) and (389, 20).
; PLAN: r0=324(x1), r1=54(y1), r2=389(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 54
LDI r2, 389
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

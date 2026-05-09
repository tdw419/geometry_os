; DESCRIPTION: Renders a black line between points (68, 28) and (484, 7).
; PLAN: r0=68(x1), r1=28(y1), r2=484(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 28
LDI r2, 484
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

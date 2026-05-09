; DESCRIPTION: Renders a black line between points (23, 106) and (430, 96).
; PLAN: r0=23(x1), r1=106(y1), r2=430(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 106
LDI r2, 430
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black line between points (52, 123) and (78, 86).
; PLAN: r0=52(x1), r1=123(y1), r2=78(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 123
LDI r2, 78
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange line between points (260, 17) and (86, 114).
; PLAN: r0=260(x1), r1=17(y1), r2=86(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 17
LDI r2, 86
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

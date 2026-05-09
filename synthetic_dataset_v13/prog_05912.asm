; DESCRIPTION: Renders a orange line between points (230, 49) and (414, 132).
; PLAN: r0=230(x1), r1=49(y1), r2=414(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 49
LDI r2, 414
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

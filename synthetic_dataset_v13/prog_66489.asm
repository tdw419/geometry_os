; DESCRIPTION: Renders a white line between points (132, 88) and (88, 22).
; PLAN: r0=132(x1), r1=88(y1), r2=88(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 88
LDI r2, 88
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

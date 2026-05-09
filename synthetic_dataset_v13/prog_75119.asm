; DESCRIPTION: Renders a yellow line between points (334, 203) and (110, 132).
; PLAN: r0=334(x1), r1=203(y1), r2=110(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 203
LDI r2, 110
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

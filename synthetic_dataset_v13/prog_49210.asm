; DESCRIPTION: Renders a orange line between points (132, 115) and (278, 243).
; PLAN: r0=132(x1), r1=115(y1), r2=278(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 115
LDI r2, 278
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

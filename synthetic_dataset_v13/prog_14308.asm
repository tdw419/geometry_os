; DESCRIPTION: Renders a purple line between points (465, 79) and (463, 52).
; PLAN: r0=465(x1), r1=79(y1), r2=463(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 79
LDI r2, 463
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

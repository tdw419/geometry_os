; DESCRIPTION: Draws a purple line from (463, 13) to (498, 75).
; PLAN: r0=463(x1), r1=13(y1), r2=498(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 13
LDI r2, 498
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

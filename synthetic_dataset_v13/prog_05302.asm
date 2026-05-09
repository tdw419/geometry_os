; DESCRIPTION: Draws a purple line from (463, 153) to (504, 7).
; PLAN: r0=463(x1), r1=153(y1), r2=504(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 153
LDI r2, 504
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

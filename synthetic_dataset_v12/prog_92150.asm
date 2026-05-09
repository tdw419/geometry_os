; DESCRIPTION: Draws a purple line from (162, 31) to (504, 33).
; PLAN: r0=162(x1), r1=31(y1), r2=504(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 31
LDI r2, 504
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

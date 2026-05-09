; DESCRIPTION: Draws a purple line from (207, 77) to (10, 33).
; PLAN: r0=207(x1), r1=77(y1), r2=10(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 77
LDI r2, 10
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

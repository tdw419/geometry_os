; DESCRIPTION: Draws a blue line from (179, 77) to (337, 172).
; PLAN: r0=179(x1), r1=77(y1), r2=337(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 77
LDI r2, 337
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

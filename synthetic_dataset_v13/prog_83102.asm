; DESCRIPTION: Draws a blue line from (179, 18) to (28, 112).
; PLAN: r0=179(x1), r1=18(y1), r2=28(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 18
LDI r2, 28
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

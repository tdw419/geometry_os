; DESCRIPTION: Draws a yellow line from (169, 88) to (179, 107).
; PLAN: r0=169(x1), r1=88(y1), r2=179(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 88
LDI r2, 179
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

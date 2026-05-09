; DESCRIPTION: Draws a black line from (169, 109) to (353, 7).
; PLAN: r0=169(x1), r1=109(y1), r2=353(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 109
LDI r2, 353
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

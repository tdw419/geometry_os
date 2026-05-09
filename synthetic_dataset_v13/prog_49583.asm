; DESCRIPTION: Draws a black line from (169, 149) to (117, 26).
; PLAN: r0=169(x1), r1=149(y1), r2=117(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 149
LDI r2, 117
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

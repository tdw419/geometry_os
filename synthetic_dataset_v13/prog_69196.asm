; DESCRIPTION: Draws a green line from (501, 222) to (169, 25).
; PLAN: r0=501(x1), r1=222(y1), r2=169(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 222
LDI r2, 169
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

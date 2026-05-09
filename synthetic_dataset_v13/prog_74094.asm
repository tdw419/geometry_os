; DESCRIPTION: Draws a blue line from (41, 167) to (122, 169).
; PLAN: r0=41(x1), r1=167(y1), r2=122(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 167
LDI r2, 122
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

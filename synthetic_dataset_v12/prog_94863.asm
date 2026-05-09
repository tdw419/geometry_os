; DESCRIPTION: Draws a black line from (330, 252) to (69, 158).
; PLAN: r0=330(x1), r1=252(y1), r2=69(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 252
LDI r2, 69
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow line from (302, 172) to (511, 69).
; PLAN: r0=302(x1), r1=172(y1), r2=511(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 172
LDI r2, 511
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

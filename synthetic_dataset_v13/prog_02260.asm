; DESCRIPTION: Draws a green line from (407, 174) to (1, 88).
; PLAN: r0=407(x1), r1=174(y1), r2=1(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 174
LDI r2, 1
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

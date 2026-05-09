; DESCRIPTION: Draws a green line from (324, 181) to (67, 137).
; PLAN: r0=324(x1), r1=181(y1), r2=67(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 181
LDI r2, 67
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

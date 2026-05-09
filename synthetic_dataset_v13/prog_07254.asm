; DESCRIPTION: Draws a green line from (258, 88) to (141, 199).
; PLAN: r0=258(x1), r1=88(y1), r2=141(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 88
LDI r2, 141
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

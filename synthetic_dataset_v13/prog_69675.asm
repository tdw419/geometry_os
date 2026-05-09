; DESCRIPTION: Draws a blue line from (43, 24) to (331, 178).
; PLAN: r0=43(x1), r1=24(y1), r2=331(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 24
LDI r2, 331
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

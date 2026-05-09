; DESCRIPTION: Places a green line segment connecting (396, 217) to (362, 227).
; PLAN: r0=396(x1), r1=217(y1), r2=362(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 217
LDI r2, 362
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

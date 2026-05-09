; DESCRIPTION: Places a blue line segment connecting (359, 9) to (329, 144).
; PLAN: r0=359(x1), r1=9(y1), r2=329(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 9
LDI r2, 329
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

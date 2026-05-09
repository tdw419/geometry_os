; DESCRIPTION: Places a blue line segment connecting (492, 117) to (101, 189).
; PLAN: r0=492(x1), r1=117(y1), r2=101(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 117
LDI r2, 101
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

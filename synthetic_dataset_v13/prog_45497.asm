; DESCRIPTION: Places a blue line segment connecting (33, 32) to (86, 248).
; PLAN: r0=33(x1), r1=32(y1), r2=86(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 32
LDI r2, 86
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

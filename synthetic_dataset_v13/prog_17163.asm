; DESCRIPTION: Places a blue line segment connecting (171, 123) to (86, 198).
; PLAN: r0=171(x1), r1=123(y1), r2=86(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 123
LDI r2, 86
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

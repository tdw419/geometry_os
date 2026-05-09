; DESCRIPTION: Places a green line segment connecting (55, 240) to (237, 123).
; PLAN: r0=55(x1), r1=240(y1), r2=237(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 240
LDI r2, 237
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

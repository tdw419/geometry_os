; DESCRIPTION: Places a blue line segment connecting (21, 33) to (68, 15).
; PLAN: r0=21(x1), r1=33(y1), r2=68(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 33
LDI r2, 68
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

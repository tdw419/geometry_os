; DESCRIPTION: Places a green line segment connecting (280, 67) to (155, 1).
; PLAN: r0=280(x1), r1=67(y1), r2=155(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 67
LDI r2, 155
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

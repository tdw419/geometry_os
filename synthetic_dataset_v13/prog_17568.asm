; DESCRIPTION: Places a yellow line segment connecting (250, 67) to (187, 160).
; PLAN: r0=250(x1), r1=67(y1), r2=187(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 67
LDI r2, 187
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

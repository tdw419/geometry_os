; DESCRIPTION: Places a green line segment connecting (313, 62) to (72, 188).
; PLAN: r0=313(x1), r1=62(y1), r2=72(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 62
LDI r2, 72
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

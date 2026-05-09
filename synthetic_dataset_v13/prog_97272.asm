; DESCRIPTION: Places a green line segment connecting (67, 91) to (385, 6).
; PLAN: r0=67(x1), r1=91(y1), r2=385(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 91
LDI r2, 385
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

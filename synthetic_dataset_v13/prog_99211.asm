; DESCRIPTION: Places a orange line segment connecting (144, 67) to (91, 195).
; PLAN: r0=144(x1), r1=67(y1), r2=91(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 67
LDI r2, 91
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

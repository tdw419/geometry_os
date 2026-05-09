; DESCRIPTION: Places a black line segment connecting (157, 67) to (156, 162).
; PLAN: r0=157(x1), r1=67(y1), r2=156(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 67
LDI r2, 156
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

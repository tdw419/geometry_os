; DESCRIPTION: Places a magenta line segment connecting (91, 3) to (67, 236).
; PLAN: r0=91(x1), r1=3(y1), r2=67(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 3
LDI r2, 67
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

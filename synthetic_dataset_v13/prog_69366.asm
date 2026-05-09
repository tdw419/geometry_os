; DESCRIPTION: Places a magenta line segment connecting (157, 203) to (445, 11).
; PLAN: r0=157(x1), r1=203(y1), r2=445(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 203
LDI r2, 445
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

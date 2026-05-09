; DESCRIPTION: Places a magenta line segment connecting (157, 72) to (268, 153).
; PLAN: r0=157(x1), r1=72(y1), r2=268(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 72
LDI r2, 268
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

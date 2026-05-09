; DESCRIPTION: Places a magenta line segment connecting (109, 157) to (303, 206).
; PLAN: r0=109(x1), r1=157(y1), r2=303(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 157
LDI r2, 303
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (11, 244) to (403, 68).
; PLAN: r0=11(x1), r1=244(y1), r2=403(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 244
LDI r2, 403
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

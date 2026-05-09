; DESCRIPTION: Places a magenta line segment connecting (129, 121) to (308, 68).
; PLAN: r0=129(x1), r1=121(y1), r2=308(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 121
LDI r2, 308
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

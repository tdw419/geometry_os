; DESCRIPTION: Places a magenta line segment connecting (456, 154) to (308, 85).
; PLAN: r0=456(x1), r1=154(y1), r2=308(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 154
LDI r2, 308
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

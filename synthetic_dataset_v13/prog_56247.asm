; DESCRIPTION: Places a magenta line segment connecting (62, 66) to (154, 38).
; PLAN: r0=62(x1), r1=66(y1), r2=154(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 66
LDI r2, 154
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

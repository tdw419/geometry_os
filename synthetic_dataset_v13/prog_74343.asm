; DESCRIPTION: Places a magenta line segment connecting (86, 50) to (221, 11).
; PLAN: r0=86(x1), r1=50(y1), r2=221(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 50
LDI r2, 221
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

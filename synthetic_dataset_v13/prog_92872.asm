; DESCRIPTION: Places a magenta line segment connecting (31, 163) to (50, 230).
; PLAN: r0=31(x1), r1=163(y1), r2=50(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 163
LDI r2, 50
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

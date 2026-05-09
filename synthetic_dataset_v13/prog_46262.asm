; DESCRIPTION: Places a magenta line segment connecting (414, 220) to (308, 86).
; PLAN: r0=414(x1), r1=220(y1), r2=308(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 220
LDI r2, 308
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

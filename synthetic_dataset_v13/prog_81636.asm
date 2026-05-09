; DESCRIPTION: Places a magenta line segment connecting (439, 163) to (256, 78).
; PLAN: r0=439(x1), r1=163(y1), r2=256(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 163
LDI r2, 256
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

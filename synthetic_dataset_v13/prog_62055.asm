; DESCRIPTION: Places a magenta line segment connecting (64, 163) to (309, 5).
; PLAN: r0=64(x1), r1=163(y1), r2=309(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 163
LDI r2, 309
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

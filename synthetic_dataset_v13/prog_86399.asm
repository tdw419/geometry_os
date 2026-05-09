; DESCRIPTION: Places a magenta line segment connecting (359, 132) to (167, 30).
; PLAN: r0=359(x1), r1=132(y1), r2=167(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 132
LDI r2, 167
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

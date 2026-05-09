; DESCRIPTION: Places a magenta line segment connecting (309, 8) to (5, 65).
; PLAN: r0=309(x1), r1=8(y1), r2=5(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 8
LDI r2, 5
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

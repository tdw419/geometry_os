; DESCRIPTION: Places a magenta line segment connecting (311, 180) to (309, 222).
; PLAN: r0=311(x1), r1=180(y1), r2=309(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 180
LDI r2, 309
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

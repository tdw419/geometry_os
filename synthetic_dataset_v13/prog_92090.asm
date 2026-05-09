; DESCRIPTION: Places a magenta line segment connecting (265, 176) to (309, 149).
; PLAN: r0=265(x1), r1=176(y1), r2=309(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 176
LDI r2, 309
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

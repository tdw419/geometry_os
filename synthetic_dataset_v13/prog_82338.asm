; DESCRIPTION: Places a magenta line segment connecting (153, 245) to (309, 162).
; PLAN: r0=153(x1), r1=245(y1), r2=309(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 245
LDI r2, 309
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

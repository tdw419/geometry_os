; DESCRIPTION: Places a magenta line segment connecting (276, 226) to (443, 105).
; PLAN: r0=276(x1), r1=226(y1), r2=443(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 226
LDI r2, 443
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (244, 178) to (66, 143).
; PLAN: r0=244(x1), r1=178(y1), r2=66(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 178
LDI r2, 66
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

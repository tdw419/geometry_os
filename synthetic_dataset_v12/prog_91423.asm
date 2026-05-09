; DESCRIPTION: Places a magenta line segment connecting (96, 91) to (349, 76).
; PLAN: r0=96(x1), r1=91(y1), r2=349(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 91
LDI r2, 349
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

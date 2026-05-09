; DESCRIPTION: Places a green line segment connecting (15, 79) to (326, 149).
; PLAN: r0=15(x1), r1=79(y1), r2=326(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 79
LDI r2, 326
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

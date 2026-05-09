; DESCRIPTION: Places a yellow line segment connecting (164, 118) to (309, 15).
; PLAN: r0=164(x1), r1=118(y1), r2=309(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 118
LDI r2, 309
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

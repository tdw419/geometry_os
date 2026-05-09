; DESCRIPTION: Places a yellow line segment connecting (85, 127) to (456, 66).
; PLAN: r0=85(x1), r1=127(y1), r2=456(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 127
LDI r2, 456
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

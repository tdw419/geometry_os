; DESCRIPTION: Places a yellow line segment connecting (456, 16) to (60, 185).
; PLAN: r0=456(x1), r1=16(y1), r2=60(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 16
LDI r2, 60
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

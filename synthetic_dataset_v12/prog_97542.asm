; DESCRIPTION: Places a yellow line segment connecting (119, 26) to (18, 82).
; PLAN: r0=119(x1), r1=26(y1), r2=18(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 26
LDI r2, 18
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

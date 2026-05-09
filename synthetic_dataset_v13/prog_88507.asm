; DESCRIPTION: Places a green line segment connecting (211, 164) to (55, 106).
; PLAN: r0=211(x1), r1=164(y1), r2=55(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 164
LDI r2, 55
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

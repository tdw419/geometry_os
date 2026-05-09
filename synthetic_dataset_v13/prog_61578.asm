; DESCRIPTION: Places a red line segment connecting (45, 232) to (44, 65).
; PLAN: r0=45(x1), r1=232(y1), r2=44(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 232
LDI r2, 44
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

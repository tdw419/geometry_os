; DESCRIPTION: Places a red line segment connecting (232, 185) to (225, 8).
; PLAN: r0=232(x1), r1=185(y1), r2=225(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 185
LDI r2, 225
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

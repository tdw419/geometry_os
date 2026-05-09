; DESCRIPTION: Places a yellow line segment connecting (15, 184) to (368, 55).
; PLAN: r0=15(x1), r1=184(y1), r2=368(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 184
LDI r2, 368
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

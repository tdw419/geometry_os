; DESCRIPTION: Places a yellow line segment connecting (104, 11) to (269, 145).
; PLAN: r0=104(x1), r1=11(y1), r2=269(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 11
LDI r2, 269
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

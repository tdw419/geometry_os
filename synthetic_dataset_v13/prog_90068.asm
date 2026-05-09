; DESCRIPTION: Places a yellow line segment connecting (212, 104) to (475, 240).
; PLAN: r0=212(x1), r1=104(y1), r2=475(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 104
LDI r2, 475
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

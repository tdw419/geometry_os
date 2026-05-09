; DESCRIPTION: Places a yellow line segment connecting (230, 185) to (376, 240).
; PLAN: r0=230(x1), r1=185(y1), r2=376(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 185
LDI r2, 376
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (404, 166) to (376, 145).
; PLAN: r0=404(x1), r1=166(y1), r2=376(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 166
LDI r2, 376
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

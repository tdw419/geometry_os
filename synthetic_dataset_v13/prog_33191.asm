; DESCRIPTION: Places a yellow line segment connecting (232, 7) to (450, 153).
; PLAN: r0=232(x1), r1=7(y1), r2=450(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 7
LDI r2, 450
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (450, 100) to (280, 222).
; PLAN: r0=450(x1), r1=100(y1), r2=280(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 100
LDI r2, 280
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

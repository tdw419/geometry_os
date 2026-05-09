; DESCRIPTION: Places a yellow line segment connecting (405, 10) to (440, 102).
; PLAN: r0=405(x1), r1=10(y1), r2=440(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 10
LDI r2, 440
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (280, 135) to (440, 232).
; PLAN: r0=280(x1), r1=135(y1), r2=440(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 135
LDI r2, 440
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

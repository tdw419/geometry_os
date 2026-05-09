; DESCRIPTION: Places a yellow line segment connecting (338, 140) to (63, 1).
; PLAN: r0=338(x1), r1=140(y1), r2=63(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 140
LDI r2, 63
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (72, 81) to (420, 23).
; PLAN: r0=72(x1), r1=81(y1), r2=420(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 81
LDI r2, 420
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

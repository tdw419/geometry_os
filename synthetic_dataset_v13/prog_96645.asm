; DESCRIPTION: Places a green line segment connecting (51, 28) to (318, 1).
; PLAN: r0=51(x1), r1=28(y1), r2=318(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 28
LDI r2, 318
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

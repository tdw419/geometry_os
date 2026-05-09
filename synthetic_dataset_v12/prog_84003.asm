; DESCRIPTION: Places a yellow line segment connecting (402, 4) to (51, 83).
; PLAN: r0=402(x1), r1=4(y1), r2=51(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 4
LDI r2, 51
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

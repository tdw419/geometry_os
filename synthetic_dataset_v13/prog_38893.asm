; DESCRIPTION: Places a yellow line segment connecting (499, 66) to (155, 73).
; PLAN: r0=499(x1), r1=66(y1), r2=155(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 66
LDI r2, 155
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

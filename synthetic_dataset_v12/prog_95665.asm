; DESCRIPTION: Places a white line segment connecting (2, 132) to (275, 155).
; PLAN: r0=2(x1), r1=132(y1), r2=275(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 132
LDI r2, 275
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (496, 113) to (104, 57).
; PLAN: r0=496(x1), r1=113(y1), r2=104(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 113
LDI r2, 104
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

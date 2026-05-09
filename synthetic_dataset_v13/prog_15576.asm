; DESCRIPTION: Places a yellow line segment connecting (119, 113) to (71, 191).
; PLAN: r0=119(x1), r1=113(y1), r2=71(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 113
LDI r2, 71
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

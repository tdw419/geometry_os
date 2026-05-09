; DESCRIPTION: Places a black line segment connecting (232, 113) to (254, 191).
; PLAN: r0=232(x1), r1=113(y1), r2=254(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 113
LDI r2, 254
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (232, 178) to (298, 48).
; PLAN: r0=232(x1), r1=178(y1), r2=298(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 178
LDI r2, 298
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

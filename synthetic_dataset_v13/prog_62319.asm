; DESCRIPTION: Places a black line segment connecting (78, 27) to (283, 25).
; PLAN: r0=78(x1), r1=27(y1), r2=283(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 27
LDI r2, 283
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

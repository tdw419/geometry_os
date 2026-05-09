; DESCRIPTION: Places a black line segment connecting (504, 91) to (151, 100).
; PLAN: r0=504(x1), r1=91(y1), r2=151(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 91
LDI r2, 151
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

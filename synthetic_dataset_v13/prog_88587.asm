; DESCRIPTION: Places a black line segment connecting (99, 41) to (338, 28).
; PLAN: r0=99(x1), r1=41(y1), r2=338(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 41
LDI r2, 338
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

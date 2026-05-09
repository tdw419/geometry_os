; DESCRIPTION: Places a black line segment connecting (245, 77) to (28, 178).
; PLAN: r0=245(x1), r1=77(y1), r2=28(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 77
LDI r2, 28
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

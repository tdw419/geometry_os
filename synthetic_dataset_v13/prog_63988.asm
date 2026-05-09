; DESCRIPTION: Places a black line segment connecting (245, 61) to (100, 209).
; PLAN: r0=245(x1), r1=61(y1), r2=100(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 61
LDI r2, 100
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black line segment connecting (271, 117) to (245, 250).
; PLAN: r0=271(x1), r1=117(y1), r2=245(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 117
LDI r2, 245
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

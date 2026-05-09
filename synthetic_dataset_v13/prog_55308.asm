; DESCRIPTION: Places a black line segment connecting (299, 46) to (23, 240).
; PLAN: r0=299(x1), r1=46(y1), r2=23(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 46
LDI r2, 23
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

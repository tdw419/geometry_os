; DESCRIPTION: Places a black line segment connecting (283, 129) to (65, 6).
; PLAN: r0=283(x1), r1=129(y1), r2=65(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 129
LDI r2, 65
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

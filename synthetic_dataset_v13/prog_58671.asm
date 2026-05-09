; DESCRIPTION: Places a black line segment connecting (43, 129) to (185, 15).
; PLAN: r0=43(x1), r1=129(y1), r2=185(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 129
LDI r2, 185
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

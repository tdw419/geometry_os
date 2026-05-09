; DESCRIPTION: Places a yellow line segment connecting (399, 189) to (335, 219).
; PLAN: r0=399(x1), r1=189(y1), r2=335(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 189
LDI r2, 335
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

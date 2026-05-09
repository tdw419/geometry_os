; DESCRIPTION: Places a black line segment connecting (473, 44) to (218, 232).
; PLAN: r0=473(x1), r1=44(y1), r2=218(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 44
LDI r2, 218
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

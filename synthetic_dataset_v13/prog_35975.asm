; DESCRIPTION: Places a white line segment connecting (192, 219) to (473, 247).
; PLAN: r0=192(x1), r1=219(y1), r2=473(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 219
LDI r2, 473
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

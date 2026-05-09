; DESCRIPTION: Places a white line segment connecting (19, 145) to (473, 196).
; PLAN: r0=19(x1), r1=145(y1), r2=473(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 145
LDI r2, 473
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

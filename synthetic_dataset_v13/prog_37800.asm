; DESCRIPTION: Places a white line segment connecting (153, 211) to (196, 218).
; PLAN: r0=153(x1), r1=211(y1), r2=196(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 211
LDI r2, 196
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

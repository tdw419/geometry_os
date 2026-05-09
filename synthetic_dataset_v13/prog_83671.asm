; DESCRIPTION: Places a white line segment connecting (449, 11) to (283, 0).
; PLAN: r0=449(x1), r1=11(y1), r2=283(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 11
LDI r2, 283
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

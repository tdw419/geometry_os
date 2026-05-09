; DESCRIPTION: Places a white line segment connecting (506, 210) to (449, 62).
; PLAN: r0=506(x1), r1=210(y1), r2=449(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 210
LDI r2, 449
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

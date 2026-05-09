; DESCRIPTION: Places a white line segment connecting (449, 183) to (91, 196).
; PLAN: r0=449(x1), r1=183(y1), r2=91(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 183
LDI r2, 91
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

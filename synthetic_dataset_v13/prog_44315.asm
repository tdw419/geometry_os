; DESCRIPTION: Places a green line segment connecting (463, 77) to (45, 138).
; PLAN: r0=463(x1), r1=77(y1), r2=45(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 77
LDI r2, 45
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

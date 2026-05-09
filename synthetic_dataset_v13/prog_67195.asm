; DESCRIPTION: Places a yellow line segment connecting (463, 131) to (473, 107).
; PLAN: r0=463(x1), r1=131(y1), r2=473(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 131
LDI r2, 473
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

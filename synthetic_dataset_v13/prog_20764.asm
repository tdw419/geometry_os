; DESCRIPTION: Places a black line segment connecting (170, 196) to (463, 107).
; PLAN: r0=170(x1), r1=196(y1), r2=463(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 196
LDI r2, 463
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

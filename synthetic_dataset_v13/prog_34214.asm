; DESCRIPTION: Places a white line segment connecting (233, 17) to (105, 25).
; PLAN: r0=233(x1), r1=17(y1), r2=105(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 17
LDI r2, 105
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

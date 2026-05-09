; DESCRIPTION: Places a white line segment connecting (68, 105) to (394, 112).
; PLAN: r0=68(x1), r1=105(y1), r2=394(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 105
LDI r2, 394
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

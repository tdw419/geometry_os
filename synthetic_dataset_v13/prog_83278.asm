; DESCRIPTION: Places a orange line segment connecting (204, 205) to (175, 124).
; PLAN: r0=204(x1), r1=205(y1), r2=175(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 205
LDI r2, 175
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

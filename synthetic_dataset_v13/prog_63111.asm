; DESCRIPTION: Renders a white line between points (331, 211) and (59, 205).
; PLAN: r0=331(x1), r1=211(y1), r2=59(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 211
LDI r2, 59
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

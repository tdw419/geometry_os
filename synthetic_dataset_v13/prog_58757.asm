; DESCRIPTION: Places a white line segment connecting (373, 243) to (35, 129).
; PLAN: r0=373(x1), r1=243(y1), r2=35(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 243
LDI r2, 35
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

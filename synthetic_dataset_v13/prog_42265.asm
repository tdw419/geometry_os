; DESCRIPTION: Renders a white line between points (431, 26) and (462, 77).
; PLAN: r0=431(x1), r1=26(y1), r2=462(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 26
LDI r2, 462
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

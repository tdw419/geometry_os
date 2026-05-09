; DESCRIPTION: Renders a white line between points (395, 62) and (78, 165).
; PLAN: r0=395(x1), r1=62(y1), r2=78(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 62
LDI r2, 78
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

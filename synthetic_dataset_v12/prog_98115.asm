; DESCRIPTION: Renders a white line between points (384, 77) and (78, 55).
; PLAN: r0=384(x1), r1=77(y1), r2=78(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 77
LDI r2, 78
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

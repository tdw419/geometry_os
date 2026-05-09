; DESCRIPTION: Renders a white line between points (205, 185) and (165, 114).
; PLAN: r0=205(x1), r1=185(y1), r2=165(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 185
LDI r2, 165
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

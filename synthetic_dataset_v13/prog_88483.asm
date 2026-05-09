; DESCRIPTION: Renders a white line between points (195, 217) and (153, 114).
; PLAN: r0=195(x1), r1=217(y1), r2=153(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 217
LDI r2, 153
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

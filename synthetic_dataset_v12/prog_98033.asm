; DESCRIPTION: Renders a white line between points (286, 175) and (466, 71).
; PLAN: r0=286(x1), r1=175(y1), r2=466(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 175
LDI r2, 466
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

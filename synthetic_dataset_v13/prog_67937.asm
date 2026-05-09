; DESCRIPTION: Renders a white line between points (306, 113) and (494, 81).
; PLAN: r0=306(x1), r1=113(y1), r2=494(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 113
LDI r2, 494
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

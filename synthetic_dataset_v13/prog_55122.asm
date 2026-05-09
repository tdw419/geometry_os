; DESCRIPTION: Renders a white line between points (233, 39) and (316, 135).
; PLAN: r0=233(x1), r1=39(y1), r2=316(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 39
LDI r2, 316
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

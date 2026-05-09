; DESCRIPTION: Renders a white line between points (316, 166) and (426, 0).
; PLAN: r0=316(x1), r1=166(y1), r2=426(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 166
LDI r2, 426
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

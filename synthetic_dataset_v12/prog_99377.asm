; DESCRIPTION: Renders a white line between points (391, 194) and (316, 90).
; PLAN: r0=391(x1), r1=194(y1), r2=316(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 194
LDI r2, 316
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

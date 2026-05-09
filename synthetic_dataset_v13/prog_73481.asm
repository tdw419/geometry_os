; DESCRIPTION: Renders a white line between points (316, 208) and (35, 250).
; PLAN: r0=316(x1), r1=208(y1), r2=35(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 208
LDI r2, 35
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

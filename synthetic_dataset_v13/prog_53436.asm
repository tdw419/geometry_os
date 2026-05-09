; DESCRIPTION: Renders a white line between points (116, 15) and (102, 170).
; PLAN: r0=116(x1), r1=15(y1), r2=102(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 15
LDI r2, 102
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

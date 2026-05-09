; DESCRIPTION: Renders a white line between points (116, 227) and (328, 162).
; PLAN: r0=116(x1), r1=227(y1), r2=328(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 227
LDI r2, 328
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

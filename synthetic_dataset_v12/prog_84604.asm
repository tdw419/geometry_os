; DESCRIPTION: Renders a white line between points (116, 252) and (236, 10).
; PLAN: r0=116(x1), r1=252(y1), r2=236(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 252
LDI r2, 236
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

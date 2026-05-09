; DESCRIPTION: Renders a orange line between points (317, 73) and (116, 9).
; PLAN: r0=317(x1), r1=73(y1), r2=116(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 73
LDI r2, 116
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

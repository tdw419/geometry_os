; DESCRIPTION: Renders a orange line between points (0, 74) and (116, 39).
; PLAN: r0=0(x1), r1=74(y1), r2=116(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 74
LDI r2, 116
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange line between points (226, 34) and (346, 190).
; PLAN: r0=226(x1), r1=34(y1), r2=346(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 34
LDI r2, 346
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

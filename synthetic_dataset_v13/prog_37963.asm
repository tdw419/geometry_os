; DESCRIPTION: Renders a red line between points (49, 146) and (19, 97).
; PLAN: r0=49(x1), r1=146(y1), r2=19(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 146
LDI r2, 19
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

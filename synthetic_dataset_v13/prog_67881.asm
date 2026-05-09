; DESCRIPTION: Renders a red line between points (310, 143) and (44, 52).
; PLAN: r0=310(x1), r1=143(y1), r2=44(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 143
LDI r2, 44
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (134, 113) and (97, 76).
; PLAN: r0=134(x1), r1=113(y1), r2=97(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 113
LDI r2, 97
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

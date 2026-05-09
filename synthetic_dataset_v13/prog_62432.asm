; DESCRIPTION: Renders a red line between points (370, 194) and (477, 223).
; PLAN: r0=370(x1), r1=194(y1), r2=477(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 194
LDI r2, 477
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

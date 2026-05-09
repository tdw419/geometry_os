; DESCRIPTION: Renders a red line between points (56, 227) and (301, 40).
; PLAN: r0=56(x1), r1=227(y1), r2=301(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 227
LDI r2, 301
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

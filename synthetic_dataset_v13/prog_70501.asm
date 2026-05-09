; DESCRIPTION: Renders a red line between points (13, 122) and (365, 17).
; PLAN: r0=13(x1), r1=122(y1), r2=365(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 122
LDI r2, 365
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

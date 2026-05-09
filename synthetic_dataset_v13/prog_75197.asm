; DESCRIPTION: Renders a red line between points (489, 203) and (98, 172).
; PLAN: r0=489(x1), r1=203(y1), r2=98(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 203
LDI r2, 98
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

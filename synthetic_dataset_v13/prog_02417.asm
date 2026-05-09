; DESCRIPTION: Renders a red line between points (203, 9) and (489, 249).
; PLAN: r0=203(x1), r1=9(y1), r2=489(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 9
LDI r2, 489
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

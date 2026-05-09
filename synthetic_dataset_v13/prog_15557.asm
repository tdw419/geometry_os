; DESCRIPTION: Renders a red line between points (400, 108) and (363, 217).
; PLAN: r0=400(x1), r1=108(y1), r2=363(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 108
LDI r2, 363
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (363, 21) and (418, 217).
; PLAN: r0=363(x1), r1=21(y1), r2=418(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 21
LDI r2, 418
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

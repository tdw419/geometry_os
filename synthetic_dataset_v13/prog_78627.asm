; DESCRIPTION: Renders a red line between points (353, 191) and (99, 99).
; PLAN: r0=353(x1), r1=191(y1), r2=99(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 191
LDI r2, 99
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

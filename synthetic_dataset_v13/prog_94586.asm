; DESCRIPTION: Renders a red line between points (33, 191) and (438, 217).
; PLAN: r0=33(x1), r1=191(y1), r2=438(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 191
LDI r2, 438
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

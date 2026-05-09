; DESCRIPTION: Renders a red line between points (363, 19) and (44, 46).
; PLAN: r0=363(x1), r1=19(y1), r2=44(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 19
LDI r2, 44
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

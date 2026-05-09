; DESCRIPTION: Renders a red line between points (319, 90) and (211, 185).
; PLAN: r0=319(x1), r1=90(y1), r2=211(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 90
LDI r2, 211
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

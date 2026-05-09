; DESCRIPTION: Renders a red line between points (286, 96) and (319, 3).
; PLAN: r0=286(x1), r1=96(y1), r2=319(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 96
LDI r2, 319
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

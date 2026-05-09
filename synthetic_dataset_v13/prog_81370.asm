; DESCRIPTION: Renders a red line between points (319, 146) and (195, 17).
; PLAN: r0=319(x1), r1=146(y1), r2=195(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 146
LDI r2, 195
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

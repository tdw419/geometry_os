; DESCRIPTION: Renders a red line between points (393, 195) and (466, 17).
; PLAN: r0=393(x1), r1=195(y1), r2=466(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 195
LDI r2, 466
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

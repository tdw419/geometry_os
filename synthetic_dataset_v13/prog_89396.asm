; DESCRIPTION: Renders a yellow line between points (246, 190) and (498, 51).
; PLAN: r0=246(x1), r1=190(y1), r2=498(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 190
LDI r2, 498
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

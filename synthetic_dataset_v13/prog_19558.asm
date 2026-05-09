; DESCRIPTION: Renders a red line between points (190, 137) and (272, 197).
; PLAN: r0=190(x1), r1=137(y1), r2=272(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 137
LDI r2, 272
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

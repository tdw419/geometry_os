; DESCRIPTION: Renders a orange line between points (246, 190) and (56, 195).
; PLAN: r0=246(x1), r1=190(y1), r2=56(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 190
LDI r2, 56
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

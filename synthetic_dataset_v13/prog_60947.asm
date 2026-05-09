; DESCRIPTION: Renders a purple line between points (246, 28) and (90, 156).
; PLAN: r0=246(x1), r1=28(y1), r2=90(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 28
LDI r2, 90
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (246, 22) to (439, 134).
; PLAN: r0=246(x1), r1=22(y1), r2=439(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 22
LDI r2, 439
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

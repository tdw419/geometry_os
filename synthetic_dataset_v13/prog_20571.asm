; DESCRIPTION: Draws a purple line from (21, 247) to (270, 246).
; PLAN: r0=21(x1), r1=247(y1), r2=270(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 247
LDI r2, 270
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (307, 60) and (286, 212).
; PLAN: r0=307(x1), r1=60(y1), r2=286(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 60
LDI r2, 286
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

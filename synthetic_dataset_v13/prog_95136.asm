; DESCRIPTION: Renders a purple line between points (433, 40) and (156, 15).
; PLAN: r0=433(x1), r1=40(y1), r2=156(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 40
LDI r2, 156
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

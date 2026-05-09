; DESCRIPTION: Renders a purple line between points (374, 16) and (408, 43).
; PLAN: r0=374(x1), r1=16(y1), r2=408(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 16
LDI r2, 408
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

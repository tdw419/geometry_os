; DESCRIPTION: Renders a purple line between points (286, 166) and (231, 28).
; PLAN: r0=286(x1), r1=166(y1), r2=231(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 166
LDI r2, 231
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

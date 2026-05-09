; DESCRIPTION: Draws a purple line from (225, 37) to (93, 21).
; PLAN: r0=225(x1), r1=37(y1), r2=93(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 37
LDI r2, 93
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

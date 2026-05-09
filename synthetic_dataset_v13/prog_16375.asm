; DESCRIPTION: Renders a purple line between points (324, 160) and (252, 127).
; PLAN: r0=324(x1), r1=160(y1), r2=252(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 160
LDI r2, 252
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

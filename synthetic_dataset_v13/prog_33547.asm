; DESCRIPTION: Renders a purple line between points (220, 58) and (50, 163).
; PLAN: r0=220(x1), r1=58(y1), r2=50(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 58
LDI r2, 50
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

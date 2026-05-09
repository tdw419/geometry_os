; DESCRIPTION: Renders a purple line between points (127, 71) and (180, 163).
; PLAN: r0=127(x1), r1=71(y1), r2=180(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 71
LDI r2, 180
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (146, 127) and (446, 118).
; PLAN: r0=146(x1), r1=127(y1), r2=446(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 127
LDI r2, 446
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

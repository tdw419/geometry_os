; DESCRIPTION: Renders a purple line between points (211, 215) and (127, 216).
; PLAN: r0=211(x1), r1=215(y1), r2=127(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 215
LDI r2, 127
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

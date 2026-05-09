; DESCRIPTION: Renders a purple line between points (107, 205) and (377, 194).
; PLAN: r0=107(x1), r1=205(y1), r2=377(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 205
LDI r2, 377
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

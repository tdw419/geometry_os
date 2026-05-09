; DESCRIPTION: Renders a purple line between points (327, 185) and (25, 108).
; PLAN: r0=327(x1), r1=185(y1), r2=25(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 185
LDI r2, 25
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

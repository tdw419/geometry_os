; DESCRIPTION: Renders a purple line between points (121, 117) and (212, 172).
; PLAN: r0=121(x1), r1=117(y1), r2=212(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 117
LDI r2, 212
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

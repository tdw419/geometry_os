; DESCRIPTION: Renders a purple line between points (339, 164) and (113, 203).
; PLAN: r0=339(x1), r1=164(y1), r2=113(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 164
LDI r2, 113
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

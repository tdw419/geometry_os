; DESCRIPTION: Draws a purple line from (443, 80) to (113, 114).
; PLAN: r0=443(x1), r1=80(y1), r2=113(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 80
LDI r2, 113
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

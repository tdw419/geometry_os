; DESCRIPTION: Places a purple line segment connecting (443, 187) to (262, 136).
; PLAN: r0=443(x1), r1=187(y1), r2=262(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 187
LDI r2, 262
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

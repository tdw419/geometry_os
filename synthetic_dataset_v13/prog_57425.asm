; DESCRIPTION: Places a purple line segment connecting (113, 176) to (74, 184).
; PLAN: r0=113(x1), r1=176(y1), r2=74(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 176
LDI r2, 74
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

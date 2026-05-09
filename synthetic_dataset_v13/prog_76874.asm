; DESCRIPTION: Places a purple line segment connecting (296, 140) to (209, 134).
; PLAN: r0=296(x1), r1=140(y1), r2=209(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 140
LDI r2, 209
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

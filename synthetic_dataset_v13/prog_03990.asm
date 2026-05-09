; DESCRIPTION: Places a purple line segment connecting (455, 208) to (443, 125).
; PLAN: r0=455(x1), r1=208(y1), r2=443(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 208
LDI r2, 443
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

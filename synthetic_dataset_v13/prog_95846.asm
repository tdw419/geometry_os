; DESCRIPTION: Places a purple line segment connecting (258, 235) to (362, 199).
; PLAN: r0=258(x1), r1=235(y1), r2=362(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 235
LDI r2, 362
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

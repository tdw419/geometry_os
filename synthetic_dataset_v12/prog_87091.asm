; DESCRIPTION: Places a purple line segment connecting (329, 235) to (83, 241).
; PLAN: r0=329(x1), r1=235(y1), r2=83(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 235
LDI r2, 83
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

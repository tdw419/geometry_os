; DESCRIPTION: Places a purple line segment connecting (101, 235) to (487, 167).
; PLAN: r0=101(x1), r1=235(y1), r2=487(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 235
LDI r2, 487
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

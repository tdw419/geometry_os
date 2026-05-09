; DESCRIPTION: Places a purple line segment connecting (174, 235) to (101, 192).
; PLAN: r0=174(x1), r1=235(y1), r2=101(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 235
LDI r2, 101
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

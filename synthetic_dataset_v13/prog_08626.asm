; DESCRIPTION: Places a purple line segment connecting (437, 235) to (272, 6).
; PLAN: r0=437(x1), r1=235(y1), r2=272(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 235
LDI r2, 272
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

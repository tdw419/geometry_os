; DESCRIPTION: Places a blue line segment connecting (235, 77) to (319, 172).
; PLAN: r0=235(x1), r1=77(y1), r2=319(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 77
LDI r2, 319
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

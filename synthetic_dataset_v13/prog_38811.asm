; DESCRIPTION: Places a red line segment connecting (185, 235) to (261, 191).
; PLAN: r0=185(x1), r1=235(y1), r2=261(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 235
LDI r2, 261
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

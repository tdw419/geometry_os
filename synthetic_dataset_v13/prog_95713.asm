; DESCRIPTION: Places a red line segment connecting (455, 235) to (276, 216).
; PLAN: r0=455(x1), r1=235(y1), r2=276(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 235
LDI r2, 276
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

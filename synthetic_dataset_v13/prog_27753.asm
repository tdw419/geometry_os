; DESCRIPTION: Places a green line segment connecting (460, 143) to (216, 235).
; PLAN: r0=460(x1), r1=143(y1), r2=216(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 143
LDI r2, 216
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

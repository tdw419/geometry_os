; DESCRIPTION: Places a red line segment connecting (362, 235) to (259, 179).
; PLAN: r0=362(x1), r1=235(y1), r2=259(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 235
LDI r2, 259
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

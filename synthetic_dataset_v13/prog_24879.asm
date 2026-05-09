; DESCRIPTION: Places a white line segment connecting (242, 235) to (476, 246).
; PLAN: r0=242(x1), r1=235(y1), r2=476(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 235
LDI r2, 476
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

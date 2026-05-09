; DESCRIPTION: Places a white line segment connecting (147, 166) to (235, 90).
; PLAN: r0=147(x1), r1=166(y1), r2=235(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 166
LDI r2, 235
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (373, 108) to (408, 235).
; PLAN: r0=373(x1), r1=108(y1), r2=408(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 108
LDI r2, 408
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

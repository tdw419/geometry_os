; DESCRIPTION: Places a white line segment connecting (321, 107) to (234, 235).
; PLAN: r0=321(x1), r1=107(y1), r2=234(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 107
LDI r2, 234
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

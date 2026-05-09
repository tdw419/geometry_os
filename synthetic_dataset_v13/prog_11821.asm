; DESCRIPTION: Places a white line segment connecting (279, 107) to (351, 76).
; PLAN: r0=279(x1), r1=107(y1), r2=351(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 107
LDI r2, 351
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

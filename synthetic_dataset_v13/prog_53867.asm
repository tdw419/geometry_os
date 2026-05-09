; DESCRIPTION: Places a white line segment connecting (351, 32) to (217, 141).
; PLAN: r0=351(x1), r1=32(y1), r2=217(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 32
LDI r2, 217
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

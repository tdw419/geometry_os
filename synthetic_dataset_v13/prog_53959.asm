; DESCRIPTION: Places a white line segment connecting (413, 237) to (511, 251).
; PLAN: r0=413(x1), r1=237(y1), r2=511(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 237
LDI r2, 511
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

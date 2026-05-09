; DESCRIPTION: Places a black line segment connecting (413, 185) to (286, 249).
; PLAN: r0=413(x1), r1=185(y1), r2=286(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 185
LDI r2, 286
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

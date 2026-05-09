; DESCRIPTION: Places a purple line segment connecting (207, 126) to (335, 214).
; PLAN: r0=207(x1), r1=126(y1), r2=335(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 126
LDI r2, 335
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red line segment connecting (361, 126) to (289, 170).
; PLAN: r0=361(x1), r1=126(y1), r2=289(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 126
LDI r2, 289
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

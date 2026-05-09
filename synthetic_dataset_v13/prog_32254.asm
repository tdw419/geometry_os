; DESCRIPTION: Places a red line segment connecting (98, 87) to (289, 189).
; PLAN: r0=98(x1), r1=87(y1), r2=289(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 87
LDI r2, 289
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

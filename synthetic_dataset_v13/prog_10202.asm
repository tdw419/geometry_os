; DESCRIPTION: Places a cyan line segment connecting (78, 200) to (289, 185).
; PLAN: r0=78(x1), r1=200(y1), r2=289(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 200
LDI r2, 289
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

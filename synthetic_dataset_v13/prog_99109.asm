; DESCRIPTION: Places a white line segment connecting (107, 21) to (289, 157).
; PLAN: r0=107(x1), r1=21(y1), r2=289(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 21
LDI r2, 289
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (171, 30) to (289, 149).
; PLAN: r0=171(x1), r1=30(y1), r2=289(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 30
LDI r2, 289
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

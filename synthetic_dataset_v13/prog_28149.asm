; DESCRIPTION: Places a white line segment connecting (353, 172) to (289, 184).
; PLAN: r0=353(x1), r1=172(y1), r2=289(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 172
LDI r2, 289
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

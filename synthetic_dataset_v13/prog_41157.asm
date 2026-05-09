; DESCRIPTION: Places a white line segment connecting (191, 5) to (289, 97).
; PLAN: r0=191(x1), r1=5(y1), r2=289(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 5
LDI r2, 289
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

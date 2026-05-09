; DESCRIPTION: Places a white line segment connecting (199, 19) to (272, 227).
; PLAN: r0=199(x1), r1=19(y1), r2=272(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 19
LDI r2, 272
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (272, 45) to (189, 0).
; PLAN: r0=272(x1), r1=45(y1), r2=189(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 45
LDI r2, 189
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

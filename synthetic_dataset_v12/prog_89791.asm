; DESCRIPTION: Places a white line segment connecting (274, 244) to (278, 137).
; PLAN: r0=274(x1), r1=244(y1), r2=278(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 244
LDI r2, 278
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

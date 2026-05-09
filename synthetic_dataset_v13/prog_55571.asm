; DESCRIPTION: Places a white line segment connecting (337, 10) to (332, 250).
; PLAN: r0=337(x1), r1=10(y1), r2=332(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 10
LDI r2, 332
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

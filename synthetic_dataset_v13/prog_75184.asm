; DESCRIPTION: Places a white line segment connecting (415, 75) to (444, 234).
; PLAN: r0=415(x1), r1=75(y1), r2=444(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 75
LDI r2, 444
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

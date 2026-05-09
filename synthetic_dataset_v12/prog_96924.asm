; DESCRIPTION: Places a white line segment connecting (474, 121) to (438, 175).
; PLAN: r0=474(x1), r1=121(y1), r2=438(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 121
LDI r2, 438
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

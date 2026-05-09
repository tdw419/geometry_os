; DESCRIPTION: Places a white line segment connecting (133, 96) to (300, 244).
; PLAN: r0=133(x1), r1=96(y1), r2=300(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 96
LDI r2, 300
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

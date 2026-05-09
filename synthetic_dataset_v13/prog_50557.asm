; DESCRIPTION: Places a white line segment connecting (384, 217) to (244, 61).
; PLAN: r0=384(x1), r1=217(y1), r2=244(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 217
LDI r2, 244
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

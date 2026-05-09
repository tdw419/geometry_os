; DESCRIPTION: Places a white line segment connecting (436, 157) to (165, 80).
; PLAN: r0=436(x1), r1=157(y1), r2=165(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 157
LDI r2, 165
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

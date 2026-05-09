; DESCRIPTION: Places a white line segment connecting (299, 20) to (189, 84).
; PLAN: r0=299(x1), r1=20(y1), r2=189(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 20
LDI r2, 189
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

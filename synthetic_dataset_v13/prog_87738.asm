; DESCRIPTION: Places a white line segment connecting (415, 238) to (337, 218).
; PLAN: r0=415(x1), r1=238(y1), r2=337(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 238
LDI r2, 337
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (480, 83) to (53, 77).
; PLAN: r0=480(x1), r1=83(y1), r2=53(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 83
LDI r2, 53
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (395, 28) to (134, 16).
; PLAN: r0=395(x1), r1=28(y1), r2=134(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 28
LDI r2, 134
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

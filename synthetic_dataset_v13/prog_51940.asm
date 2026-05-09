; DESCRIPTION: Places a white line segment connecting (501, 238) to (176, 0).
; PLAN: r0=501(x1), r1=238(y1), r2=176(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 238
LDI r2, 176
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

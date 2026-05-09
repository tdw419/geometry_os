; DESCRIPTION: Places a white line segment connecting (482, 119) to (0, 161).
; PLAN: r0=482(x1), r1=119(y1), r2=0(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 119
LDI r2, 0
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

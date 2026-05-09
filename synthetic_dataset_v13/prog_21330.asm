; DESCRIPTION: Places a white line segment connecting (250, 179) to (482, 59).
; PLAN: r0=250(x1), r1=179(y1), r2=482(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 179
LDI r2, 482
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

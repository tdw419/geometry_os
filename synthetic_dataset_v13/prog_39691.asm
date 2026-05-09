; DESCRIPTION: Places a white line segment connecting (161, 240) to (365, 110).
; PLAN: r0=161(x1), r1=240(y1), r2=365(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 240
LDI r2, 365
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

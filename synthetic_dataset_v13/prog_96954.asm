; DESCRIPTION: Places a white line segment connecting (164, 95) to (419, 26).
; PLAN: r0=164(x1), r1=95(y1), r2=419(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 95
LDI r2, 419
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (162, 4) to (397, 211).
; PLAN: r0=162(x1), r1=4(y1), r2=397(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 4
LDI r2, 397
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

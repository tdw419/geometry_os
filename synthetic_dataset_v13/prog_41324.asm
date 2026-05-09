; DESCRIPTION: Places a white line segment connecting (389, 128) to (110, 233).
; PLAN: r0=389(x1), r1=128(y1), r2=110(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 128
LDI r2, 110
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (79, 96) to (227, 161).
; PLAN: r0=79(x1), r1=96(y1), r2=227(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 96
LDI r2, 227
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

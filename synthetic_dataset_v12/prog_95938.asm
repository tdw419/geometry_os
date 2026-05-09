; DESCRIPTION: Places a white line segment connecting (123, 175) to (458, 219).
; PLAN: r0=123(x1), r1=175(y1), r2=458(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 175
LDI r2, 458
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

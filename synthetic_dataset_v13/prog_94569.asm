; DESCRIPTION: Places a white line segment connecting (175, 222) to (334, 79).
; PLAN: r0=175(x1), r1=222(y1), r2=334(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 222
LDI r2, 334
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

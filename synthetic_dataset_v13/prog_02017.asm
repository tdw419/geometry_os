; DESCRIPTION: Places a white line segment connecting (300, 79) to (495, 175).
; PLAN: r0=300(x1), r1=79(y1), r2=495(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 79
LDI r2, 495
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

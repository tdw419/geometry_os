; DESCRIPTION: Places a white line segment connecting (22, 79) to (49, 209).
; PLAN: r0=22(x1), r1=79(y1), r2=49(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 79
LDI r2, 49
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

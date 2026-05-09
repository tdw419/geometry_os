; DESCRIPTION: Places a white line segment connecting (205, 57) to (255, 116).
; PLAN: r0=205(x1), r1=57(y1), r2=255(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 57
LDI r2, 255
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

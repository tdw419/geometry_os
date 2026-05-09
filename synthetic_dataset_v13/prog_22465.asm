; DESCRIPTION: Places a white line segment connecting (68, 64) to (436, 149).
; PLAN: r0=68(x1), r1=64(y1), r2=436(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 64
LDI r2, 436
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

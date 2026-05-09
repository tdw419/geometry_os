; DESCRIPTION: Places a white line segment connecting (431, 98) to (244, 47).
; PLAN: r0=431(x1), r1=98(y1), r2=244(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 98
LDI r2, 244
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

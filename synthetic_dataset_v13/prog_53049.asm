; DESCRIPTION: Places a white line segment connecting (462, 39) to (49, 160).
; PLAN: r0=462(x1), r1=39(y1), r2=49(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 39
LDI r2, 49
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

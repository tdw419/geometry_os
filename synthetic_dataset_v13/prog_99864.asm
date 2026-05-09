; DESCRIPTION: Places a white line segment connecting (477, 29) to (462, 117).
; PLAN: r0=477(x1), r1=29(y1), r2=462(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 29
LDI r2, 462
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

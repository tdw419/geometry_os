; DESCRIPTION: Places a white line segment connecting (86, 85) to (72, 44).
; PLAN: r0=86(x1), r1=85(y1), r2=72(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 85
LDI r2, 72
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

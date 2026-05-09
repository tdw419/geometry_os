; DESCRIPTION: Places a white line segment connecting (164, 87) to (426, 23).
; PLAN: r0=164(x1), r1=87(y1), r2=426(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 87
LDI r2, 426
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

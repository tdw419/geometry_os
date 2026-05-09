; DESCRIPTION: Places a white line segment connecting (389, 245) to (426, 21).
; PLAN: r0=389(x1), r1=245(y1), r2=426(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 245
LDI r2, 426
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

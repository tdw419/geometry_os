; DESCRIPTION: Places a white line segment connecting (226, 245) to (78, 178).
; PLAN: r0=226(x1), r1=245(y1), r2=78(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 245
LDI r2, 78
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

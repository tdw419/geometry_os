; DESCRIPTION: Places a white line segment connecting (182, 245) to (461, 54).
; PLAN: r0=182(x1), r1=245(y1), r2=461(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 245
LDI r2, 461
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (85, 82) to (437, 241).
; PLAN: r0=85(x1), r1=82(y1), r2=437(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 82
LDI r2, 437
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

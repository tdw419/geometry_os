; DESCRIPTION: Places a white line segment connecting (39, 241) to (47, 241).
; PLAN: r0=39(x1), r1=241(y1), r2=47(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 241
LDI r2, 47
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

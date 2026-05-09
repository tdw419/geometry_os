; DESCRIPTION: Places a white line segment connecting (241, 53) to (473, 31).
; PLAN: r0=241(x1), r1=53(y1), r2=473(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 53
LDI r2, 473
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (373, 74) to (469, 57).
; PLAN: r0=373(x1), r1=74(y1), r2=469(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 74
LDI r2, 469
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (158, 251) to (117, 57).
; PLAN: r0=158(x1), r1=251(y1), r2=117(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 251
LDI r2, 117
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

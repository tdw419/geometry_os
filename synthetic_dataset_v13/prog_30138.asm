; DESCRIPTION: Places a white line segment connecting (304, 57) to (114, 162).
; PLAN: r0=304(x1), r1=57(y1), r2=114(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 57
LDI r2, 114
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

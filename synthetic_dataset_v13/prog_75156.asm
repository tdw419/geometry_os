; DESCRIPTION: Places a white line segment connecting (233, 34) to (304, 202).
; PLAN: r0=233(x1), r1=34(y1), r2=304(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 34
LDI r2, 304
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

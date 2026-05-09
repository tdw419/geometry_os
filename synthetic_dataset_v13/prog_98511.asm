; DESCRIPTION: Places a white line segment connecting (187, 49) to (304, 59).
; PLAN: r0=187(x1), r1=49(y1), r2=304(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 49
LDI r2, 304
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (304, 204) to (59, 73).
; PLAN: r0=304(x1), r1=204(y1), r2=59(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 204
LDI r2, 59
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

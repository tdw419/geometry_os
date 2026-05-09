; DESCRIPTION: Places a white line segment connecting (198, 154) to (304, 71).
; PLAN: r0=198(x1), r1=154(y1), r2=304(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 154
LDI r2, 304
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

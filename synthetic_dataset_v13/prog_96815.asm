; DESCRIPTION: Places a white line segment connecting (184, 161) to (304, 156).
; PLAN: r0=184(x1), r1=161(y1), r2=304(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 161
LDI r2, 304
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

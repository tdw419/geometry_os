; DESCRIPTION: Places a white line segment connecting (233, 121) to (34, 125).
; PLAN: r0=233(x1), r1=121(y1), r2=34(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 121
LDI r2, 34
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

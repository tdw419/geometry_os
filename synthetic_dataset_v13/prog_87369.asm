; DESCRIPTION: Places a white line segment connecting (163, 146) to (221, 41).
; PLAN: r0=163(x1), r1=146(y1), r2=221(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 146
LDI r2, 221
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (43, 82) to (232, 28).
; PLAN: r0=43(x1), r1=82(y1), r2=232(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 82
LDI r2, 232
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

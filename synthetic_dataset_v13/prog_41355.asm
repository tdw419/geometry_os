; DESCRIPTION: Places a white line segment connecting (161, 82) to (285, 100).
; PLAN: r0=161(x1), r1=82(y1), r2=285(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 82
LDI r2, 285
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (174, 25) to (379, 168).
; PLAN: r0=174(x1), r1=25(y1), r2=379(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 25
LDI r2, 379
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

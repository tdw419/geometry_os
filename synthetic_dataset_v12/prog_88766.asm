; DESCRIPTION: Places a white line segment connecting (11, 178) to (98, 73).
; PLAN: r0=11(x1), r1=178(y1), r2=98(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 178
LDI r2, 98
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

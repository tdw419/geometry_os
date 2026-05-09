; DESCRIPTION: Places a white line segment connecting (156, 92) to (165, 13).
; PLAN: r0=156(x1), r1=92(y1), r2=165(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 92
LDI r2, 165
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (52, 118) to (256, 156).
; PLAN: r0=52(x1), r1=118(y1), r2=256(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 118
LDI r2, 256
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

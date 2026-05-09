; DESCRIPTION: Places a white line segment connecting (344, 175) to (112, 81).
; PLAN: r0=344(x1), r1=175(y1), r2=112(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 175
LDI r2, 112
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

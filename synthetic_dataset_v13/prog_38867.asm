; DESCRIPTION: Places a white line segment connecting (425, 66) to (217, 205).
; PLAN: r0=425(x1), r1=66(y1), r2=217(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 66
LDI r2, 217
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

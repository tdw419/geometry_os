; DESCRIPTION: Places a white line segment connecting (98, 22) to (425, 249).
; PLAN: r0=98(x1), r1=22(y1), r2=425(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 22
LDI r2, 425
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

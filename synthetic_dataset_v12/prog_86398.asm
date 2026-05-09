; DESCRIPTION: Places a white line segment connecting (37, 28) to (444, 187).
; PLAN: r0=37(x1), r1=28(y1), r2=444(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 28
LDI r2, 444
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

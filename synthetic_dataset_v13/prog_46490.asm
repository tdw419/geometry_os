; DESCRIPTION: Places a white line segment connecting (380, 66) to (207, 64).
; PLAN: r0=380(x1), r1=66(y1), r2=207(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 66
LDI r2, 207
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

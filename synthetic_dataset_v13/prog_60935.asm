; DESCRIPTION: Draws a white line from (308, 78) to (343, 187).
; PLAN: r0=308(x1), r1=78(y1), r2=343(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 78
LDI r2, 343
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

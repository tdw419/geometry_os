; DESCRIPTION: Draws a white line from (343, 62) to (5, 14).
; PLAN: r0=343(x1), r1=62(y1), r2=5(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 62
LDI r2, 5
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white line from (268, 80) to (31, 25).
; PLAN: r0=268(x1), r1=80(y1), r2=31(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 80
LDI r2, 31
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

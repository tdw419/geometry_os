; DESCRIPTION: Draws a white line from (5, 142) to (437, 2).
; PLAN: r0=5(x1), r1=142(y1), r2=437(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 142
LDI r2, 437
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

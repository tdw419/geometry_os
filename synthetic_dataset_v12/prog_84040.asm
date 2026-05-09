; DESCRIPTION: Draws a white line from (481, 141) to (89, 201).
; PLAN: r0=481(x1), r1=141(y1), r2=89(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 141
LDI r2, 89
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

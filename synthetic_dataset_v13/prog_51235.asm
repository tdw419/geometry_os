; DESCRIPTION: Draws a white line from (119, 117) to (7, 121).
; PLAN: r0=119(x1), r1=117(y1), r2=7(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 117
LDI r2, 7
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white line from (462, 138) to (149, 121).
; PLAN: r0=462(x1), r1=138(y1), r2=149(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 138
LDI r2, 149
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

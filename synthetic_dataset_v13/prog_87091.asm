; DESCRIPTION: Draws a white line from (148, 115) to (472, 18).
; PLAN: r0=148(x1), r1=115(y1), r2=472(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 115
LDI r2, 472
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

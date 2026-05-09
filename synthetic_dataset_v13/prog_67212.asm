; DESCRIPTION: Draws a white line from (158, 123) to (216, 53).
; PLAN: r0=158(x1), r1=123(y1), r2=216(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 123
LDI r2, 216
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

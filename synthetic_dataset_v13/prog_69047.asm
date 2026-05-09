; DESCRIPTION: Draws a black line from (93, 162) to (148, 141).
; PLAN: r0=93(x1), r1=162(y1), r2=148(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 162
LDI r2, 148
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

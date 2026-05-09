; DESCRIPTION: Draws a black line from (158, 166) to (462, 18).
; PLAN: r0=158(x1), r1=166(y1), r2=462(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 166
LDI r2, 462
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

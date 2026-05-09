; DESCRIPTION: Draws a blue line from (102, 178) to (15, 115).
; PLAN: r0=102(x1), r1=178(y1), r2=15(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 178
LDI r2, 15
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

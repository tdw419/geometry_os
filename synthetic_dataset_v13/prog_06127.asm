; DESCRIPTION: Draws a blue line from (18, 141) to (114, 178).
; PLAN: r0=18(x1), r1=141(y1), r2=114(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 141
LDI r2, 114
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

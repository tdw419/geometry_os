; DESCRIPTION: Draws a magenta line from (456, 35) to (455, 118).
; PLAN: r0=456(x1), r1=35(y1), r2=455(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 35
LDI r2, 455
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

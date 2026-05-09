; DESCRIPTION: Draws a blue line from (462, 197) to (65, 165).
; PLAN: r0=462(x1), r1=197(y1), r2=65(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 197
LDI r2, 65
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

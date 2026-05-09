; DESCRIPTION: Draws a blue line from (197, 146) to (153, 101).
; PLAN: r0=197(x1), r1=146(y1), r2=153(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 146
LDI r2, 153
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

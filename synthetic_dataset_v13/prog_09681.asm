; DESCRIPTION: Draws a blue line from (197, 106) to (321, 106).
; PLAN: r0=197(x1), r1=106(y1), r2=321(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 106
LDI r2, 321
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

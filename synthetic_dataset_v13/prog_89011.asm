; DESCRIPTION: Draws a blue line from (153, 197) to (73, 50).
; PLAN: r0=153(x1), r1=197(y1), r2=73(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 197
LDI r2, 73
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

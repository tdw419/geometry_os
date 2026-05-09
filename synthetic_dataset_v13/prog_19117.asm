; DESCRIPTION: Draws a blue line from (372, 197) to (216, 5).
; PLAN: r0=372(x1), r1=197(y1), r2=216(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 197
LDI r2, 216
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

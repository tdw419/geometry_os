; DESCRIPTION: Draws a blue line from (237, 0) to (197, 122).
; PLAN: r0=237(x1), r1=0(y1), r2=197(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 0
LDI r2, 197
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue line from (337, 237) to (420, 197).
; PLAN: r0=337(x1), r1=237(y1), r2=420(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 237
LDI r2, 420
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

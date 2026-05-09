; DESCRIPTION: Draws a blue line from (509, 194) to (258, 197).
; PLAN: r0=509(x1), r1=194(y1), r2=258(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 194
LDI r2, 258
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue line from (159, 86) to (126, 153).
; PLAN: r0=159(x1), r1=86(y1), r2=126(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 86
LDI r2, 126
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

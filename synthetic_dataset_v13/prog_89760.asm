; DESCRIPTION: Draws a blue line from (206, 12) to (53, 49).
; PLAN: r0=206(x1), r1=12(y1), r2=53(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 12
LDI r2, 53
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

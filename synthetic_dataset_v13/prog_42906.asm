; DESCRIPTION: Draws a blue line from (53, 83) to (64, 74).
; PLAN: r0=53(x1), r1=83(y1), r2=64(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 83
LDI r2, 64
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

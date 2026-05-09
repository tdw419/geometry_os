; DESCRIPTION: Draws a blue line from (131, 35) to (327, 219).
; PLAN: r0=131(x1), r1=35(y1), r2=327(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 35
LDI r2, 327
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

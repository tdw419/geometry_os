; DESCRIPTION: Draws a blue line from (49, 225) to (92, 219).
; PLAN: r0=49(x1), r1=225(y1), r2=92(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 225
LDI r2, 92
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue line from (184, 92) to (291, 182).
; PLAN: r0=184(x1), r1=92(y1), r2=291(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 92
LDI r2, 291
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

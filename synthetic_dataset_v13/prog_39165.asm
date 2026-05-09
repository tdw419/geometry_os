; DESCRIPTION: Draws a blue line from (64, 121) to (242, 116).
; PLAN: r0=64(x1), r1=121(y1), r2=242(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 121
LDI r2, 242
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue line from (103, 92) to (511, 214).
; PLAN: r0=103(x1), r1=92(y1), r2=511(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 92
LDI r2, 511
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

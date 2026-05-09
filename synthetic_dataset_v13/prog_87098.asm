; DESCRIPTION: Draws a blue line from (308, 92) to (202, 167).
; PLAN: r0=308(x1), r1=92(y1), r2=202(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 92
LDI r2, 202
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

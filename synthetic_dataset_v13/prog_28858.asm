; DESCRIPTION: Draws a blue line from (278, 92) to (181, 166).
; PLAN: r0=278(x1), r1=92(y1), r2=181(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 92
LDI r2, 181
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

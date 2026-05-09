; DESCRIPTION: Draws a white line from (45, 92) to (472, 255).
; PLAN: r0=45(x1), r1=92(y1), r2=472(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 92
LDI r2, 472
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

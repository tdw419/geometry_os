; DESCRIPTION: Draws a white line from (412, 92) to (266, 62).
; PLAN: r0=412(x1), r1=92(y1), r2=266(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 92
LDI r2, 266
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

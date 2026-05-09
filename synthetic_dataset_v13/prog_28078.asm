; DESCRIPTION: Draws a blue line from (436, 31) to (504, 7).
; PLAN: r0=436(x1), r1=31(y1), r2=504(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 31
LDI r2, 504
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

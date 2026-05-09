; DESCRIPTION: Draws a blue line from (57, 59) to (458, 15).
; PLAN: r0=57(x1), r1=59(y1), r2=458(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 59
LDI r2, 458
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

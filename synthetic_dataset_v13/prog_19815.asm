; DESCRIPTION: Draws a blue line from (31, 59) to (437, 15).
; PLAN: r0=31(x1), r1=59(y1), r2=437(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 59
LDI r2, 437
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

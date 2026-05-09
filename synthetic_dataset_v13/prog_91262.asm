; DESCRIPTION: Draws a blue line from (20, 39) to (380, 170).
; PLAN: r0=20(x1), r1=39(y1), r2=380(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 39
LDI r2, 380
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

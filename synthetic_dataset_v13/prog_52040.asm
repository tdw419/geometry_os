; DESCRIPTION: Draws a blue line from (414, 39) to (30, 190).
; PLAN: r0=414(x1), r1=39(y1), r2=30(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 39
LDI r2, 30
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

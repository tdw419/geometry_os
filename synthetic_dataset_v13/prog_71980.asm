; DESCRIPTION: Draws a black line from (349, 123) to (12, 190).
; PLAN: r0=349(x1), r1=123(y1), r2=12(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 123
LDI r2, 12
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

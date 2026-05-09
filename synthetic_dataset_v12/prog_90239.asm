; DESCRIPTION: Draws a black line from (139, 151) to (389, 163).
; PLAN: r0=139(x1), r1=151(y1), r2=389(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 151
LDI r2, 389
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (287, 113) to (437, 163).
; PLAN: r0=287(x1), r1=113(y1), r2=437(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 113
LDI r2, 437
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

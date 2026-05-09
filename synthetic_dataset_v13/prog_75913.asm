; DESCRIPTION: Draws a black line from (108, 43) to (486, 238).
; PLAN: r0=108(x1), r1=43(y1), r2=486(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 43
LDI r2, 486
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (85, 165) to (322, 14).
; PLAN: r0=85(x1), r1=165(y1), r2=322(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 165
LDI r2, 322
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

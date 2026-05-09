; DESCRIPTION: Draws a black line from (292, 116) to (484, 65).
; PLAN: r0=292(x1), r1=116(y1), r2=484(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 116
LDI r2, 484
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

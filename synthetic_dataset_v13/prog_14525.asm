; DESCRIPTION: Draws a black line from (232, 96) to (20, 82).
; PLAN: r0=232(x1), r1=96(y1), r2=20(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 96
LDI r2, 20
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

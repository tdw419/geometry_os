; DESCRIPTION: Draws a black line from (55, 113) to (60, 11).
; PLAN: r0=55(x1), r1=113(y1), r2=60(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 113
LDI r2, 60
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

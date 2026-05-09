; DESCRIPTION: Draws a black line from (182, 110) to (424, 69).
; PLAN: r0=182(x1), r1=110(y1), r2=424(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 110
LDI r2, 424
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

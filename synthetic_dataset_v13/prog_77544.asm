; DESCRIPTION: Draws a black line from (437, 49) to (288, 246).
; PLAN: r0=437(x1), r1=49(y1), r2=288(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 49
LDI r2, 288
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

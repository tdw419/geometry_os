; DESCRIPTION: Draws a black line from (33, 92) to (192, 95).
; PLAN: r0=33(x1), r1=92(y1), r2=192(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 92
LDI r2, 192
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

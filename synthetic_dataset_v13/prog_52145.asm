; DESCRIPTION: Draws a green line from (39, 43) to (336, 88).
; PLAN: r0=39(x1), r1=43(y1), r2=336(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 43
LDI r2, 336
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

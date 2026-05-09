; DESCRIPTION: Draws a black line from (306, 101) to (32, 218).
; PLAN: r0=306(x1), r1=101(y1), r2=32(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 101
LDI r2, 32
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (11, 21) to (412, 62).
; PLAN: r0=11(x1), r1=21(y1), r2=412(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 21
LDI r2, 412
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

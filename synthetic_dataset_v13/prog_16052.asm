; DESCRIPTION: Draws a black line from (121, 80) to (88, 234).
; PLAN: r0=121(x1), r1=80(y1), r2=88(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 80
LDI r2, 88
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

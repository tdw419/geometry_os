; DESCRIPTION: Draws a black line from (121, 164) to (117, 102).
; PLAN: r0=121(x1), r1=164(y1), r2=117(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 164
LDI r2, 117
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (303, 160) to (161, 121).
; PLAN: r0=303(x1), r1=160(y1), r2=161(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 160
LDI r2, 161
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

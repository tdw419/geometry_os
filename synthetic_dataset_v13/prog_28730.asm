; DESCRIPTION: Draws a red line from (340, 101) to (161, 233).
; PLAN: r0=340(x1), r1=101(y1), r2=161(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 101
LDI r2, 161
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

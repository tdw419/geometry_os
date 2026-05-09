; DESCRIPTION: Draws a red line from (171, 161) to (424, 105).
; PLAN: r0=171(x1), r1=161(y1), r2=424(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 161
LDI r2, 424
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

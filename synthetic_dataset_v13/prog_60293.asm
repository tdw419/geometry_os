; DESCRIPTION: Draws a red line from (234, 167) to (118, 65).
; PLAN: r0=234(x1), r1=167(y1), r2=118(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 167
LDI r2, 118
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

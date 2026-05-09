; DESCRIPTION: Draws a red line from (282, 233) to (456, 187).
; PLAN: r0=282(x1), r1=233(y1), r2=456(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 233
LDI r2, 456
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

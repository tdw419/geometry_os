; DESCRIPTION: Draws a red line from (456, 58) to (303, 179).
; PLAN: r0=456(x1), r1=58(y1), r2=303(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 58
LDI r2, 303
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

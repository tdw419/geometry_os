; DESCRIPTION: Draws a red line from (309, 100) to (114, 16).
; PLAN: r0=309(x1), r1=100(y1), r2=114(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 100
LDI r2, 114
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

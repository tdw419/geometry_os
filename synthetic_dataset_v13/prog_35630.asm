; DESCRIPTION: Draws a red line from (114, 70) to (162, 195).
; PLAN: r0=114(x1), r1=70(y1), r2=162(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 70
LDI r2, 162
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

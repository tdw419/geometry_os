; DESCRIPTION: Draws a red line from (114, 14) to (91, 135).
; PLAN: r0=114(x1), r1=14(y1), r2=91(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 14
LDI r2, 91
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

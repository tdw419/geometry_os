; DESCRIPTION: Draws a red line from (306, 206) to (431, 68).
; PLAN: r0=306(x1), r1=206(y1), r2=431(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 206
LDI r2, 431
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

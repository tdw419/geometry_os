; DESCRIPTION: Draws a red line from (108, 232) to (156, 153).
; PLAN: r0=108(x1), r1=232(y1), r2=156(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 232
LDI r2, 156
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

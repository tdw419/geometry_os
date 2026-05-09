; DESCRIPTION: Draws a red line from (301, 23) to (192, 246).
; PLAN: r0=301(x1), r1=23(y1), r2=192(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 23
LDI r2, 192
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

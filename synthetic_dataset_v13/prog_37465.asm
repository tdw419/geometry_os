; DESCRIPTION: Draws a red line from (304, 151) to (318, 197).
; PLAN: r0=304(x1), r1=151(y1), r2=318(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 151
LDI r2, 318
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

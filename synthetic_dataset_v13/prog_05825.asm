; DESCRIPTION: Draws a red line from (373, 116) to (424, 158).
; PLAN: r0=373(x1), r1=116(y1), r2=424(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 116
LDI r2, 424
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

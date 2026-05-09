; DESCRIPTION: Draws a red line from (435, 143) to (431, 155).
; PLAN: r0=435(x1), r1=143(y1), r2=431(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 143
LDI r2, 431
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

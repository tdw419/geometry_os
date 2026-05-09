; DESCRIPTION: Draws a red line from (416, 12) to (18, 155).
; PLAN: r0=416(x1), r1=12(y1), r2=18(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 12
LDI r2, 18
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

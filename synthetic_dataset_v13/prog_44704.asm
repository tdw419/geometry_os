; DESCRIPTION: Draws a red line from (416, 57) to (262, 95).
; PLAN: r0=416(x1), r1=57(y1), r2=262(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 57
LDI r2, 262
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

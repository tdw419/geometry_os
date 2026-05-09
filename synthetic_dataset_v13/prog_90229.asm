; DESCRIPTION: Draws a red line from (416, 90) to (346, 20).
; PLAN: r0=416(x1), r1=90(y1), r2=346(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 90
LDI r2, 346
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

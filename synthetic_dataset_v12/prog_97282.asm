; DESCRIPTION: Draws a red line from (320, 61) to (74, 141).
; PLAN: r0=320(x1), r1=61(y1), r2=74(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 61
LDI r2, 74
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

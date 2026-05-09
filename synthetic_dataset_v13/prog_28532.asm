; DESCRIPTION: Draws a red line from (198, 118) to (402, 93).
; PLAN: r0=198(x1), r1=118(y1), r2=402(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 118
LDI r2, 402
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

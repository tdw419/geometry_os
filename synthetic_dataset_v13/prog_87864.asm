; DESCRIPTION: Draws a black line from (184, 118) to (146, 61).
; PLAN: r0=184(x1), r1=118(y1), r2=146(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 118
LDI r2, 146
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

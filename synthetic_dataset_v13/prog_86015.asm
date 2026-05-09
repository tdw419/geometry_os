; DESCRIPTION: Draws a red line from (436, 118) to (48, 93).
; PLAN: r0=436(x1), r1=118(y1), r2=48(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 118
LDI r2, 48
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

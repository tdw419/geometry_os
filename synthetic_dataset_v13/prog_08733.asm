; DESCRIPTION: Draws a red line from (294, 118) to (500, 57).
; PLAN: r0=294(x1), r1=118(y1), r2=500(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 118
LDI r2, 500
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

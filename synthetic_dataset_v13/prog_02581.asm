; DESCRIPTION: Draws a red line from (504, 93) to (22, 158).
; PLAN: r0=504(x1), r1=93(y1), r2=22(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 93
LDI r2, 22
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

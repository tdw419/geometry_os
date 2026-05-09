; DESCRIPTION: Draws a red line from (103, 93) to (490, 202).
; PLAN: r0=103(x1), r1=93(y1), r2=490(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 93
LDI r2, 490
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

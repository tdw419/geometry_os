; DESCRIPTION: Draws a red line from (493, 168) to (476, 47).
; PLAN: r0=493(x1), r1=168(y1), r2=476(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 168
LDI r2, 476
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

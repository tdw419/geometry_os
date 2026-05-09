; DESCRIPTION: Draws a red line from (14, 131) to (241, 30).
; PLAN: r0=14(x1), r1=131(y1), r2=241(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 131
LDI r2, 241
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red line from (327, 144) to (452, 120).
; PLAN: r0=327(x1), r1=144(y1), r2=452(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 144
LDI r2, 452
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

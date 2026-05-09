; DESCRIPTION: Draws a red line from (292, 32) to (166, 168).
; PLAN: r0=292(x1), r1=32(y1), r2=166(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 32
LDI r2, 166
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

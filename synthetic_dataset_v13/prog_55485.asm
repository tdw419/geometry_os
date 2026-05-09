; DESCRIPTION: Draws a red line from (166, 125) to (236, 10).
; PLAN: r0=166(x1), r1=125(y1), r2=236(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 125
LDI r2, 236
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

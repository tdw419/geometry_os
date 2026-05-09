; DESCRIPTION: Draws a red line from (232, 68) to (498, 146).
; PLAN: r0=232(x1), r1=68(y1), r2=498(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 68
LDI r2, 498
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

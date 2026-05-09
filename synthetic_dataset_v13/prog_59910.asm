; DESCRIPTION: Draws a red line from (408, 186) to (324, 166).
; PLAN: r0=408(x1), r1=186(y1), r2=324(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 186
LDI r2, 324
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

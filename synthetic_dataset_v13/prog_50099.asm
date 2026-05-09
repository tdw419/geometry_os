; DESCRIPTION: Draws a yellow line from (25, 166) to (79, 55).
; PLAN: r0=25(x1), r1=166(y1), r2=79(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 166
LDI r2, 79
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

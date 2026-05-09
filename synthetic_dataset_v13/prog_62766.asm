; DESCRIPTION: Draws a orange line from (111, 153) to (82, 188).
; PLAN: r0=111(x1), r1=153(y1), r2=82(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 153
LDI r2, 82
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

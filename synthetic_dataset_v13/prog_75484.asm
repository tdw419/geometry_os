; DESCRIPTION: Draws a orange line from (233, 166) to (258, 173).
; PLAN: r0=233(x1), r1=166(y1), r2=258(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 166
LDI r2, 258
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

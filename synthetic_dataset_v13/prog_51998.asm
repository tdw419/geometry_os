; DESCRIPTION: Draws a red line from (183, 148) to (40, 23).
; PLAN: r0=183(x1), r1=148(y1), r2=40(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 148
LDI r2, 40
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

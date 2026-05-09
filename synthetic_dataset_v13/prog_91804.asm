; DESCRIPTION: Draws a magenta line from (153, 175) to (25, 245).
; PLAN: r0=153(x1), r1=175(y1), r2=25(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 175
LDI r2, 25
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

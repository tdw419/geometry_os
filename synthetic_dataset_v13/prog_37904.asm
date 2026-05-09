; DESCRIPTION: Draws a blue line from (246, 29) to (25, 26).
; PLAN: r0=246(x1), r1=29(y1), r2=25(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 29
LDI r2, 25
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

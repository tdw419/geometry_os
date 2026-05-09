; DESCRIPTION: Draws a red line from (490, 16) to (118, 69).
; PLAN: r0=490(x1), r1=16(y1), r2=118(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 16
LDI r2, 118
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

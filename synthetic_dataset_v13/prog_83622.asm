; DESCRIPTION: Draws a red line from (69, 100) to (26, 64).
; PLAN: r0=69(x1), r1=100(y1), r2=26(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 100
LDI r2, 26
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

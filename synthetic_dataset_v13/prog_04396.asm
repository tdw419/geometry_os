; DESCRIPTION: Draws a red line from (185, 137) to (183, 69).
; PLAN: r0=185(x1), r1=137(y1), r2=183(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 137
LDI r2, 183
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

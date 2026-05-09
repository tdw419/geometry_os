; DESCRIPTION: Draws a red line from (490, 72) to (281, 141).
; PLAN: r0=490(x1), r1=72(y1), r2=281(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 72
LDI r2, 281
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

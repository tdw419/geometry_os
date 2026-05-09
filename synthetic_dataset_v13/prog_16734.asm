; DESCRIPTION: Draws a red line from (511, 109) to (100, 135).
; PLAN: r0=511(x1), r1=109(y1), r2=100(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 109
LDI r2, 100
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

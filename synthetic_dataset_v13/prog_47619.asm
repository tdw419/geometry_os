; DESCRIPTION: Draws a red line from (511, 199) to (142, 4).
; PLAN: r0=511(x1), r1=199(y1), r2=142(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 199
LDI r2, 142
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

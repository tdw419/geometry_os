; DESCRIPTION: Draws a red line from (496, 33) to (106, 121).
; PLAN: r0=496(x1), r1=33(y1), r2=106(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 33
LDI r2, 106
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

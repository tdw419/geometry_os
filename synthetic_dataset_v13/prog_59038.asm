; DESCRIPTION: Draws a red line from (195, 189) to (138, 101).
; PLAN: r0=195(x1), r1=189(y1), r2=138(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 189
LDI r2, 138
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

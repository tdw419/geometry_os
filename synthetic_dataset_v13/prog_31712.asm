; DESCRIPTION: Draws a red line from (18, 151) to (25, 81).
; PLAN: r0=18(x1), r1=151(y1), r2=25(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 151
LDI r2, 25
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

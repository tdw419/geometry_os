; DESCRIPTION: Draws a red line from (179, 149) to (426, 5).
; PLAN: r0=179(x1), r1=149(y1), r2=426(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 149
LDI r2, 426
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

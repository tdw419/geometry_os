; DESCRIPTION: Draws a red line from (144, 87) to (81, 26).
; PLAN: r0=144(x1), r1=87(y1), r2=81(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 87
LDI r2, 81
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red line from (144, 177) to (426, 15).
; PLAN: r0=144(x1), r1=177(y1), r2=426(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 177
LDI r2, 426
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

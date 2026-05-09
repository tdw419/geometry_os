; DESCRIPTION: Draws a red line from (74, 37) to (431, 144).
; PLAN: r0=74(x1), r1=37(y1), r2=431(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 37
LDI r2, 431
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

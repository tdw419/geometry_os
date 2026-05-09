; DESCRIPTION: Draws a black line from (174, 118) to (190, 52).
; PLAN: r0=174(x1), r1=118(y1), r2=190(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 118
LDI r2, 190
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow line from (217, 134) to (190, 52).
; PLAN: r0=217(x1), r1=134(y1), r2=190(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 134
LDI r2, 190
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

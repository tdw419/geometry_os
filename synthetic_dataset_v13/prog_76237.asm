; DESCRIPTION: Draws a yellow line from (150, 19) to (382, 190).
; PLAN: r0=150(x1), r1=19(y1), r2=382(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 19
LDI r2, 382
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

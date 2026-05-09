; DESCRIPTION: Draws a purple line from (340, 54) to (61, 190).
; PLAN: r0=340(x1), r1=54(y1), r2=61(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 54
LDI r2, 61
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow line from (417, 217) to (288, 190).
; PLAN: r0=417(x1), r1=217(y1), r2=288(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 217
LDI r2, 288
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow line from (10, 8) to (95, 190).
; PLAN: r0=10(x1), r1=8(y1), r2=95(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 8
LDI r2, 95
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

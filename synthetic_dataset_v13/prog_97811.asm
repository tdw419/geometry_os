; DESCRIPTION: Draws a yellow line from (386, 248) to (3, 190).
; PLAN: r0=386(x1), r1=248(y1), r2=3(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 248
LDI r2, 3
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

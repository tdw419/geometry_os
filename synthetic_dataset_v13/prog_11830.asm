; DESCRIPTION: Draws a yellow line from (223, 190) to (388, 134).
; PLAN: r0=223(x1), r1=190(y1), r2=388(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 190
LDI r2, 388
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

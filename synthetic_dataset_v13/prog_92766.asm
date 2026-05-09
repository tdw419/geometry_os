; DESCRIPTION: Draws a yellow line from (151, 249) to (317, 190).
; PLAN: r0=151(x1), r1=249(y1), r2=317(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 249
LDI r2, 317
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

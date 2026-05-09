; DESCRIPTION: Draws a red line from (490, 57) to (151, 94).
; PLAN: r0=490(x1), r1=57(y1), r2=151(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 57
LDI r2, 151
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

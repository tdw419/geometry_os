; DESCRIPTION: Draws a yellow line from (118, 121) to (413, 19).
; PLAN: r0=118(x1), r1=121(y1), r2=413(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 121
LDI r2, 413
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

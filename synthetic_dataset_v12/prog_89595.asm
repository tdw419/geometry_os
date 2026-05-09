; DESCRIPTION: Draws a red line from (264, 248) to (449, 112).
; PLAN: r0=264(x1), r1=248(y1), r2=449(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 248
LDI r2, 449
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

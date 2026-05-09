; DESCRIPTION: Draws a yellow line from (15, 247) to (211, 191).
; PLAN: r0=15(x1), r1=247(y1), r2=211(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 247
LDI r2, 211
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

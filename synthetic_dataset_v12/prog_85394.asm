; DESCRIPTION: Draws a yellow line from (145, 249) to (205, 100).
; PLAN: r0=145(x1), r1=249(y1), r2=205(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 249
LDI r2, 205
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

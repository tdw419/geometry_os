; DESCRIPTION: Draws a yellow line from (337, 94) to (185, 6).
; PLAN: r0=337(x1), r1=94(y1), r2=185(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 94
LDI r2, 185
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow line from (340, 158) to (65, 249).
; PLAN: r0=340(x1), r1=158(y1), r2=65(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 158
LDI r2, 65
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

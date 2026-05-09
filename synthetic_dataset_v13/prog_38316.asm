; DESCRIPTION: Draws a yellow line from (6, 160) to (407, 209).
; PLAN: r0=6(x1), r1=160(y1), r2=407(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 160
LDI r2, 407
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

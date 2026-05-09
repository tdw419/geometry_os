; DESCRIPTION: Draws a yellow line from (107, 20) to (136, 3).
; PLAN: r0=107(x1), r1=20(y1), r2=136(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 20
LDI r2, 136
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

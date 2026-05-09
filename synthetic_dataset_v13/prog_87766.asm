; DESCRIPTION: Draws a purple line from (86, 5) to (281, 136).
; PLAN: r0=86(x1), r1=5(y1), r2=281(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 5
LDI r2, 281
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

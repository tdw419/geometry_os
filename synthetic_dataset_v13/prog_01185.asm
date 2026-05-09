; DESCRIPTION: Draws a yellow line from (252, 56) to (269, 25).
; PLAN: r0=252(x1), r1=56(y1), r2=269(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 56
LDI r2, 269
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

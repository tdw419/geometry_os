; DESCRIPTION: Draws a yellow line from (54, 24) to (9, 211).
; PLAN: r0=54(x1), r1=24(y1), r2=9(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 24
LDI r2, 9
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

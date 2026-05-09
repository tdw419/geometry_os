; DESCRIPTION: Draws a yellow line from (505, 60) to (500, 224).
; PLAN: r0=505(x1), r1=60(y1), r2=500(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 60
LDI r2, 500
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

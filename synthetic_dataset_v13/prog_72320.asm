; DESCRIPTION: Draws a yellow line from (459, 188) to (21, 40).
; PLAN: r0=459(x1), r1=188(y1), r2=21(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 188
LDI r2, 21
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

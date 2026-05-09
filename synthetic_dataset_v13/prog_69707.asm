; DESCRIPTION: Draws a yellow line from (7, 80) to (129, 255).
; PLAN: r0=7(x1), r1=80(y1), r2=129(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 80
LDI r2, 129
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

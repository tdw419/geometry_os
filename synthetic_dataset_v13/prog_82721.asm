; DESCRIPTION: Draws a yellow line from (436, 5) to (129, 83).
; PLAN: r0=436(x1), r1=5(y1), r2=129(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 5
LDI r2, 129
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

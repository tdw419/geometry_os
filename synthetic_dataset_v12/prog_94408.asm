; DESCRIPTION: Places a yellow line segment connecting (181, 43) to (502, 74).
; PLAN: r0=181(x1), r1=43(y1), r2=502(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 43
LDI r2, 502
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow line from (421, 103) to (205, 185).
; PLAN: r0=421(x1), r1=103(y1), r2=205(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 103
LDI r2, 205
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

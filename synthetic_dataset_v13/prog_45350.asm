; DESCRIPTION: Draws a yellow line from (303, 188) to (421, 36).
; PLAN: r0=303(x1), r1=188(y1), r2=421(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 188
LDI r2, 421
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

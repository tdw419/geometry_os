; DESCRIPTION: Draws a magenta line from (221, 198) to (245, 184).
; PLAN: r0=221(x1), r1=198(y1), r2=245(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 198
LDI r2, 245
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

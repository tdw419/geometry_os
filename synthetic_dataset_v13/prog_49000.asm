; DESCRIPTION: Draws a yellow line from (441, 212) to (204, 224).
; PLAN: r0=441(x1), r1=212(y1), r2=204(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 212
LDI r2, 204
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

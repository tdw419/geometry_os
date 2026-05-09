; DESCRIPTION: Draws a yellow line from (294, 253) to (222, 203).
; PLAN: r0=294(x1), r1=253(y1), r2=222(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 253
LDI r2, 222
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

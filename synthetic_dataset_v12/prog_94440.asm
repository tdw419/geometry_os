; DESCRIPTION: Draws a yellow line from (253, 59) to (28, 222).
; PLAN: r0=253(x1), r1=59(y1), r2=28(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 59
LDI r2, 28
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

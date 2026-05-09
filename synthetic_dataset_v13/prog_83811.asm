; DESCRIPTION: Draws a yellow line from (256, 250) to (373, 81).
; PLAN: r0=256(x1), r1=250(y1), r2=373(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 250
LDI r2, 373
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (373, 32) to (390, 10).
; PLAN: r0=373(x1), r1=32(y1), r2=390(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 32
LDI r2, 390
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

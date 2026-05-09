; DESCRIPTION: Draws a yellow line from (444, 194) to (372, 100).
; PLAN: r0=444(x1), r1=194(y1), r2=372(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 194
LDI r2, 372
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

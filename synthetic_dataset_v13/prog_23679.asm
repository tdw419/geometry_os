; DESCRIPTION: Draws a yellow line from (424, 40) to (210, 144).
; PLAN: r0=424(x1), r1=40(y1), r2=210(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 40
LDI r2, 210
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

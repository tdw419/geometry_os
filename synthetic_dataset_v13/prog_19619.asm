; DESCRIPTION: Draws a yellow line from (265, 141) to (431, 24).
; PLAN: r0=265(x1), r1=141(y1), r2=431(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 141
LDI r2, 431
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

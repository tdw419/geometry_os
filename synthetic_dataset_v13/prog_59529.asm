; DESCRIPTION: Draws a yellow line from (301, 249) to (125, 129).
; PLAN: r0=301(x1), r1=249(y1), r2=125(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 249
LDI r2, 125
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

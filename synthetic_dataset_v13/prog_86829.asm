; DESCRIPTION: Draws a yellow line from (349, 62) to (183, 35).
; PLAN: r0=349(x1), r1=62(y1), r2=183(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 62
LDI r2, 183
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

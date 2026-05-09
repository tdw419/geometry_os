; DESCRIPTION: Draws a yellow line from (12, 220) to (349, 159).
; PLAN: r0=12(x1), r1=220(y1), r2=349(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 220
LDI r2, 349
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

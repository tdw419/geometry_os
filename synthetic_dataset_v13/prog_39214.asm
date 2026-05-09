; DESCRIPTION: Draws a yellow line from (304, 150) to (150, 119).
; PLAN: r0=304(x1), r1=150(y1), r2=150(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 150
LDI r2, 150
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow line from (435, 102) to (206, 11).
; PLAN: r0=435(x1), r1=102(y1), r2=206(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 102
LDI r2, 206
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

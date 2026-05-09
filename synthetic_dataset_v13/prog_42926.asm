; DESCRIPTION: Draws a yellow line from (7, 24) to (319, 10).
; PLAN: r0=7(x1), r1=24(y1), r2=319(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 24
LDI r2, 319
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

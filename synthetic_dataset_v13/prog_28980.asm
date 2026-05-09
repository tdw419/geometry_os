; DESCRIPTION: Draws a yellow line from (319, 2) to (297, 50).
; PLAN: r0=319(x1), r1=2(y1), r2=297(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 2
LDI r2, 297
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

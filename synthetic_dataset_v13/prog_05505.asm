; DESCRIPTION: Draws a green line from (319, 101) to (297, 64).
; PLAN: r0=319(x1), r1=101(y1), r2=297(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 101
LDI r2, 297
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

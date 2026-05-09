; DESCRIPTION: Draws a green line from (195, 227) to (111, 156).
; PLAN: r0=195(x1), r1=227(y1), r2=111(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 227
LDI r2, 111
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

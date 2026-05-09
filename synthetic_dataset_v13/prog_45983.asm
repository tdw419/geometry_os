; DESCRIPTION: Draws a green line from (494, 99) to (183, 212).
; PLAN: r0=494(x1), r1=99(y1), r2=183(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 99
LDI r2, 183
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue line from (281, 245) to (506, 183).
; PLAN: r0=281(x1), r1=245(y1), r2=506(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 245
LDI r2, 506
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

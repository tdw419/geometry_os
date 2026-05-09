; DESCRIPTION: Draws a magenta line from (204, 159) to (24, 62).
; PLAN: r0=204(x1), r1=159(y1), r2=24(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 159
LDI r2, 24
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

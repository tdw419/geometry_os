; DESCRIPTION: Draws a yellow line from (510, 183) to (204, 81).
; PLAN: r0=510(x1), r1=183(y1), r2=204(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 183
LDI r2, 204
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow line from (324, 204) to (301, 109).
; PLAN: r0=324(x1), r1=204(y1), r2=301(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 204
LDI r2, 301
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

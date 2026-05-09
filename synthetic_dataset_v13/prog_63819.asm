; DESCRIPTION: Draws a yellow line from (414, 253) to (409, 190).
; PLAN: r0=414(x1), r1=253(y1), r2=409(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 253
LDI r2, 409
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

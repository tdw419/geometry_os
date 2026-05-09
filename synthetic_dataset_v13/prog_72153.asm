; DESCRIPTION: Draws a yellow line from (204, 204) to (195, 211).
; PLAN: r0=204(x1), r1=204(y1), r2=195(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 204
LDI r2, 195
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

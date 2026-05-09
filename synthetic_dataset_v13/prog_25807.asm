; DESCRIPTION: Draws a yellow line from (321, 204) to (130, 8).
; PLAN: r0=321(x1), r1=204(y1), r2=130(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 204
LDI r2, 130
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

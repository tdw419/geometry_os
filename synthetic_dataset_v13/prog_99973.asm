; DESCRIPTION: Draws a yellow line from (124, 128) to (204, 12).
; PLAN: r0=124(x1), r1=128(y1), r2=204(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 128
LDI r2, 204
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

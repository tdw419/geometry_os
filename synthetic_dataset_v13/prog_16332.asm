; DESCRIPTION: Draws a yellow line from (23, 97) to (409, 182).
; PLAN: r0=23(x1), r1=97(y1), r2=409(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 97
LDI r2, 409
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

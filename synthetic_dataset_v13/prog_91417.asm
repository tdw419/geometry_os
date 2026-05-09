; DESCRIPTION: Draws a yellow line from (56, 25) to (46, 248).
; PLAN: r0=56(x1), r1=25(y1), r2=46(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 25
LDI r2, 46
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

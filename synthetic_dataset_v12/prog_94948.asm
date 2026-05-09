; DESCRIPTION: Draws a yellow line from (46, 67) to (478, 110).
; PLAN: r0=46(x1), r1=67(y1), r2=478(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 67
LDI r2, 478
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

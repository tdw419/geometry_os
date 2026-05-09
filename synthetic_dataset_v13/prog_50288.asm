; DESCRIPTION: Renders a yellow line between points (104, 248) and (287, 46).
; PLAN: r0=104(x1), r1=248(y1), r2=287(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 248
LDI r2, 287
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

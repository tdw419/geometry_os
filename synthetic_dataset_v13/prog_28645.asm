; DESCRIPTION: Draws a yellow line from (268, 80) to (409, 82).
; PLAN: r0=268(x1), r1=80(y1), r2=409(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 80
LDI r2, 409
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

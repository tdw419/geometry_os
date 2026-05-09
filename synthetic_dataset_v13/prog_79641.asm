; DESCRIPTION: Draws a yellow line from (124, 244) to (252, 3).
; PLAN: r0=124(x1), r1=244(y1), r2=252(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 244
LDI r2, 252
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

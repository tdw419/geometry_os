; DESCRIPTION: Places a yellow line segment connecting (204, 105) to (284, 18).
; PLAN: r0=204(x1), r1=105(y1), r2=284(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 105
LDI r2, 284
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (284, 43) to (211, 188).
; PLAN: r0=284(x1), r1=43(y1), r2=211(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 43
LDI r2, 211
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (169, 17) to (284, 141).
; PLAN: r0=169(x1), r1=17(y1), r2=284(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 17
LDI r2, 284
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (80, 150) to (284, 88).
; PLAN: r0=80(x1), r1=150(y1), r2=284(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 150
LDI r2, 284
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

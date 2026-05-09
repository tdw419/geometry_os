; DESCRIPTION: Places a yellow line segment connecting (15, 97) to (284, 9).
; PLAN: r0=15(x1), r1=97(y1), r2=284(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 97
LDI r2, 284
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

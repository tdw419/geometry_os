; DESCRIPTION: Places a black line segment connecting (290, 246) to (482, 13).
; PLAN: r0=290(x1), r1=246(y1), r2=482(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 246
LDI r2, 482
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

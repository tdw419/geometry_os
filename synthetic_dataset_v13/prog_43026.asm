; DESCRIPTION: Places a red line segment connecting (364, 224) to (17, 13).
; PLAN: r0=364(x1), r1=224(y1), r2=17(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 224
LDI r2, 17
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

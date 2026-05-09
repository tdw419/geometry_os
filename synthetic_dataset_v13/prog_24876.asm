; DESCRIPTION: Renders a yellow line between points (468, 224) and (15, 21).
; PLAN: r0=468(x1), r1=224(y1), r2=15(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 224
LDI r2, 15
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

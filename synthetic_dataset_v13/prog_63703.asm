; DESCRIPTION: Composite: Places a green line segment connecting (363, 15) to (65, 160) then Draws a orange circle centered at (469, 28) with radius 24.
; PLAN: r0=363(x1), r1=15(y1), r2=65(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=28(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 15
LDI r2, 65
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 28
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

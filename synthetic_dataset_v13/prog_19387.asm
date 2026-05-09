; DESCRIPTION: Composite: Places a orange line segment connecting (56, 24) to (491, 144) then Creates a cyan circular shape at (220, 211) with radius 29.
; PLAN: r0=56(x1), r1=24(y1), r2=491(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=211(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 56
LDI r1, 24
LDI r2, 491
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 211
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

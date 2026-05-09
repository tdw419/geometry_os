; DESCRIPTION: Composite: Places a orange circle of radius 80 at center (372, 88) then Creates a black rectangular region at (7, 87) spanning 87 by 91 pixels.
; PLAN: r0=372(x), r1=88(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=87(y), r7=87(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 88
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 87
LDI r7, 87
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Places a black circle of radius 57 at center (370, 130) then Creates a black rectangular region at (128, 9) spanning 34 by 84 pixels.
; PLAN: r0=370(x), r1=130(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x), r6=9(y), r7=34(width), r8=84(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 130
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 9
LDI r7, 34
LDI r8, 84
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

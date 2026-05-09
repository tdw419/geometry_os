; DESCRIPTION: Composite: Places a black circle of radius 11 at center (491, 194) then Renders a white box of size 23x13 starting at (72, 130).
; PLAN: r0=491(x), r1=194(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=130(y), r7=23(width), r8=13(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 194
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 130
LDI r7, 23
LDI r8, 13
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT

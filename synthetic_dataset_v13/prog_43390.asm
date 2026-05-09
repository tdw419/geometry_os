; DESCRIPTION: Composite: Places a orange circle of radius 21 at center (53, 199) then Renders a black box of size 22x21 starting at (217, 2).
; PLAN: r0=53(x), r1=199(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=2(y), r7=22(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 199
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 2
LDI r7, 22
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

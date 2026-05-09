; DESCRIPTION: Composite: Renders a red box of size 18x108 starting at (288, 104) then Renders a orange disk with center (364, 172) and radius 32.
; PLAN: r0=288(x), r1=104(y), r2=18(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=172(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 104
LDI r2, 18
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 172
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

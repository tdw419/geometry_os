; DESCRIPTION: Composite: Renders a orange disk with center (332, 160) and radius 10 then Renders a red box of size 75x119 starting at (244, 45).
; PLAN: r0=332(x), r1=160(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=45(y), r7=75(width), r8=119(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 160
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 45
LDI r7, 75
LDI r8, 119
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

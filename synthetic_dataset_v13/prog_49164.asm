; DESCRIPTION: Composite: Creates a orange circular shape at (222, 31) with radius 11 then Renders a black box of size 55x19 starting at (115, 181).
; PLAN: r0=222(x), r1=31(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=181(y), r7=55(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 31
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 181
LDI r7, 55
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

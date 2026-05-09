; DESCRIPTION: Composite: Renders a red box of size 100x26 starting at (66, 160) then Renders a orange disk with center (345, 192) and radius 41.
; PLAN: r0=66(x), r1=160(y), r2=100(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=192(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 66
LDI r1, 160
LDI r2, 100
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 192
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

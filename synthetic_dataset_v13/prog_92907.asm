; DESCRIPTION: Composite: Renders a orange box of size 48x76 starting at (296, 23) then Creates a red circular shape at (265, 179) with radius 67.
; PLAN: r0=296(x), r1=23(y), r2=48(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=179(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 23
LDI r2, 48
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 179
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

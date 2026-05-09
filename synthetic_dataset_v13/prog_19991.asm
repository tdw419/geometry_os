; DESCRIPTION: Composite: Renders a cyan disk with center (244, 123) and radius 64 then Renders a orange box of size 102x72 starting at (348, 117).
; PLAN: r0=244(x), r1=123(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=117(y), r7=102(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 123
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 117
LDI r7, 102
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT

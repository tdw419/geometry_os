; DESCRIPTION: Composite: Draws a magenta circle centered at (413, 76) with radius 16 then Creates a orange rectangular region at (348, 62) spanning 100 by 95 pixels.
; PLAN: r0=413(x), r1=76(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=62(y), r7=100(width), r8=95(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 76
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 62
LDI r7, 100
LDI r8, 95
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT

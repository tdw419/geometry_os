; DESCRIPTION: Composite: Places a magenta circle of radius 12 at center (128, 78) then Renders a red box of size 45x80 starting at (396, 18).
; PLAN: r0=128(x), r1=78(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=18(y), r7=45(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 78
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 18
LDI r7, 45
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

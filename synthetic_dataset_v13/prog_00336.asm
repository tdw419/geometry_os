; DESCRIPTION: Composite: Renders a red box of size 74x37 starting at (184, 210) then Renders a green disk with center (116, 21) and radius 11.
; PLAN: r0=184(x), r1=210(y), r2=74(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=21(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 210
LDI r2, 74
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 21
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

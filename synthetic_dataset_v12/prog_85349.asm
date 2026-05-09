; DESCRIPTION: Composite: Places a red circle of radius 36 at center (224, 90) then Renders a red box of size 115x100 starting at (172, 64).
; PLAN: r0=224(x), r1=90(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=64(y), r7=115(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 90
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 64
LDI r7, 115
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

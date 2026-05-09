; DESCRIPTION: Composite: Creates a white circular shape at (435, 81) with radius 47 then Renders a red box of size 84x96 starting at (201, 54).
; PLAN: r0=435(x), r1=81(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=54(y), r7=84(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 81
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 54
LDI r7, 84
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

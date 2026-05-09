; DESCRIPTION: Composite: Creates a yellow circular shape at (334, 202) with radius 49 then Renders a red box of size 44x88 starting at (255, 33).
; PLAN: r0=334(x), r1=202(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=33(y), r7=44(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 202
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 33
LDI r7, 44
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Renders a red box of size 78x110 starting at (111, 141) then Renders a red disk with center (137, 208) and radius 20.
; PLAN: r0=111(x), r1=141(y), r2=78(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=208(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 141
LDI r2, 78
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 208
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

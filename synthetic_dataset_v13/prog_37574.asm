; DESCRIPTION: Composite: Renders a blue disk with center (110, 155) and radius 69 then Renders a red box of size 50x102 starting at (323, 102).
; PLAN: r0=110(x), r1=155(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=102(y), r7=50(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 155
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 102
LDI r7, 50
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

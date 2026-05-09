; DESCRIPTION: Composite: Renders a red disk with center (403, 158) and radius 28 then Creates a green rectangular region at (20, 27) spanning 43 by 58 pixels.
; PLAN: r0=403(x), r1=158(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=27(y), r7=43(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 158
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 27
LDI r7, 43
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

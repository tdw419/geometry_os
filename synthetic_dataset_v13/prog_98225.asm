; DESCRIPTION: Composite: Creates a green rectangular region at (5, 154) spanning 43 by 102 pixels then Renders a cyan disk with center (291, 106) and radius 74.
; PLAN: r0=5(x), r1=154(y), r2=43(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=106(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 154
LDI r2, 43
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 106
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

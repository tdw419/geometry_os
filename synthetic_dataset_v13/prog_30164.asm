; DESCRIPTION: Composite: Creates a black circular shape at (102, 167) with radius 77 then Renders a green box of size 24x92 starting at (435, 100).
; PLAN: r0=102(x), r1=167(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=100(y), r7=24(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 167
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 100
LDI r7, 24
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

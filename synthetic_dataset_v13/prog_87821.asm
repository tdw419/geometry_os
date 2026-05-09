; DESCRIPTION: Composite: Renders a green box of size 62x114 starting at (417, 92) then Creates a red circular shape at (392, 183) with radius 29.
; PLAN: r0=417(x), r1=92(y), r2=62(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=183(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 92
LDI r2, 62
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 183
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

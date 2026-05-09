; DESCRIPTION: Composite: Creates a green rectangular region at (340, 75) spanning 74 by 43 pixels then Renders a green disk with center (315, 182) and radius 16.
; PLAN: r0=340(x), r1=75(y), r2=74(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=182(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 75
LDI r2, 74
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 182
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

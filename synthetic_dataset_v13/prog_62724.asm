; DESCRIPTION: Composite: Creates a yellow rectangular region at (319, 68) spanning 47 by 72 pixels then Renders a green disk with center (209, 112) and radius 41.
; PLAN: r0=319(x), r1=68(y), r2=47(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=112(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 68
LDI r2, 47
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 112
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

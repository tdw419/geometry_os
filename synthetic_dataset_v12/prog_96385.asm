; DESCRIPTION: Composite: Creates a blue rectangular region at (158, 71) spanning 54 by 28 pixels then Renders a red disk with center (408, 137) and radius 44.
; PLAN: r0=158(x), r1=71(y), r2=54(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=137(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 158
LDI r1, 71
LDI r2, 54
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 137
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

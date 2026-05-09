; DESCRIPTION: Composite: Creates a green rectangular region at (318, 96) spanning 111 by 51 pixels then Places a red circle of radius 68 at center (363, 118).
; PLAN: r0=318(x), r1=96(y), r2=111(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=118(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 96
LDI r2, 111
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 118
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

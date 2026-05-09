; DESCRIPTION: Composite: Creates a purple rectangular region at (277, 73) spanning 81 by 104 pixels then Renders a green disk with center (315, 94) and radius 78.
; PLAN: r0=277(x), r1=73(y), r2=81(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=94(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 277
LDI r1, 73
LDI r2, 81
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 94
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

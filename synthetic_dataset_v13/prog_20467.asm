; DESCRIPTION: Composite: Sets a single purple pixel at (424, 234) then Creates a blue rectangular region at (39, 200) spanning 88 by 20 pixels then Renders a red disk with center (92, 101) and radius 78.
; PLAN: r0=424(x), r1=234(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=39(x), r6=200(y), r7=88(width), r8=20(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x), r11=101(y), r12=78(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 424
LDI r1, 234
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 39
LDI r6, 200
LDI r7, 88
LDI r8, 20
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 101
LDI r12, 78
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

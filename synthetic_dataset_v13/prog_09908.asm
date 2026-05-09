; DESCRIPTION: Composite: Sets a single white pixel at (307, 172) then Creates a yellow rectangular region at (332, 64) spanning 46 by 112 pixels then Renders a red disk with center (299, 118) and radius 31.
; PLAN: r0=307(x), r1=172(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=64(y), r7=46(width), r8=112(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=299(x), r11=118(y), r12=31(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 172
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 64
LDI r7, 46
LDI r8, 112
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 118
LDI r12, 31
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Sets a single yellow pixel at (224, 138) then Creates a red rectangular region at (48, 158) spanning 95 by 46 pixels then Creates a red circular shape at (227, 73) with radius 48.
; PLAN: r0=224(x), r1=138(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=158(y), r7=95(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x), r11=73(y), r12=48(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 224
LDI r1, 138
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 48
LDI r6, 158
LDI r7, 95
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 73
LDI r12, 48
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

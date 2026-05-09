; DESCRIPTION: Composite: Creates a red circular shape at (223, 167) with radius 62 then Creates a purple rectangular region at (401, 29) spanning 41 by 86 pixels then Sets a single magenta pixel at (3, 153).
; PLAN: r0=223(x), r1=167(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=29(y), r7=41(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=3(x), r11=153(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 167
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 29
LDI r7, 41
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 153
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

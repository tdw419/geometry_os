; DESCRIPTION: Composite: Creates a purple circular shape at (271, 146) with radius 71 then Creates a orange rectangular region at (21, 114) spanning 76 by 71 pixels then Places a magenta dot at position (35, 187).
; PLAN: r0=271(x), r1=146(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=114(y), r7=76(width), r8=71(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=35(x), r11=187(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 146
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 114
LDI r7, 76
LDI r8, 71
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 187
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

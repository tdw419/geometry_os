; DESCRIPTION: Composite: Creates a cyan circular shape at (171, 118) with radius 42 then Places a green dot at position (301, 46) then Creates a red rectangular region at (49, 13) spanning 53 by 118 pixels.
; PLAN: r0=171(x), r1=118(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=46(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=49(x), r11=13(y), r12=53(width), r13=118(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 118
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 46
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 49
LDI r11, 13
LDI r12, 53
LDI r13, 118
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

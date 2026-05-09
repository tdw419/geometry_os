; DESCRIPTION: Composite: Places a black circle of radius 53 at center (395, 56) then Creates a red rectangular region at (114, 57) spanning 86 by 37 pixels then Places a red dot at position (215, 216).
; PLAN: r0=395(x), r1=56(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=114(x), r6=57(y), r7=86(width), r8=37(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x), r11=216(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 395
LDI r1, 56
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 114
LDI r6, 57
LDI r7, 86
LDI r8, 37
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 216
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

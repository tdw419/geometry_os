; DESCRIPTION: Composite: Creates a white circular shape at (355, 176) with radius 23 then Places a purple 69x19 rectangle at position (337, 34) then Sets a single black pixel at (32, 0).
; PLAN: r0=355(x), r1=176(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x), r6=34(y), r7=69(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=32(x), r11=0(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 355
LDI r1, 176
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 34
LDI r7, 69
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 0
LDI r12, 0x000000
PSET r10, r11, r12
HALT

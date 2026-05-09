; DESCRIPTION: Composite: Creates a green circular shape at (53, 57) with radius 21 then Places a black 86x82 rectangle at position (29, 151) then Sets a single white pixel at (15, 70).
; PLAN: r0=53(x), r1=57(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=151(y), r7=86(width), r8=82(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=15(x), r11=70(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 57
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 151
LDI r7, 86
LDI r8, 82
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 15
LDI r11, 70
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT

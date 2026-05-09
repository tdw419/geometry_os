; DESCRIPTION: Composite: Places a green dot at position (311, 157) then Draws a purple circle centered at (292, 86) with radius 35 then Places a white 53x98 rectangle at position (72, 31).
; PLAN: r0=311(x), r1=157(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=86(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x), r11=31(y), r12=53(width), r13=98(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 157
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 292
LDI r6, 86
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 31
LDI r12, 53
LDI r13, 98
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT

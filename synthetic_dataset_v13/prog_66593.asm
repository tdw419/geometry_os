; DESCRIPTION: Composite: Creates a cyan circular shape at (365, 184) with radius 21 then Sets a single black pixel at (238, 30) then Draws a purple rectangle at (338, 42) with width 33 and height 45.
; PLAN: r0=365(x), r1=184(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x), r6=30(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=42(y), r12=33(width), r13=45(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 184
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 30
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 338
LDI r11, 42
LDI r12, 33
LDI r13, 45
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

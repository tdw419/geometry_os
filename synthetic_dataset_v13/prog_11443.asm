; DESCRIPTION: Composite: Draws a white circle centered at (336, 94) with radius 21 then Sets a single blue pixel at (321, 237) then Places a cyan 42x95 rectangle at position (337, 134).
; PLAN: r0=336(x), r1=94(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=237(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=134(y), r12=42(width), r13=95(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 94
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 237
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 134
LDI r12, 42
LDI r13, 95
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT

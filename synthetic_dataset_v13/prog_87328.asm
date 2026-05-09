; DESCRIPTION: Composite: Renders a magenta disk with center (326, 128) and radius 23 then Places a black dot at position (418, 236) then Places a orange 60x76 rectangle at position (76, 22).
; PLAN: r0=326(x), r1=128(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=236(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=76(x), r11=22(y), r12=60(width), r13=76(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 128
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 236
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 76
LDI r11, 22
LDI r12, 60
LDI r13, 76
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

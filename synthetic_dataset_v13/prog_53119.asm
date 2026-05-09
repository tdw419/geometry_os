; DESCRIPTION: Composite: Places a cyan 105x24 rectangle at position (284, 63) then Renders a red disk with center (256, 155) and radius 76 then Sets a single cyan pixel at (347, 141).
; PLAN: r0=284(x), r1=63(y), r2=105(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=155(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=347(x), r11=141(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 284
LDI r1, 63
LDI r2, 105
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 155
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 347
LDI r11, 141
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT

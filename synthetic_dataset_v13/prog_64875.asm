; DESCRIPTION: Composite: Renders a yellow box of size 64x12 starting at (76, 17) then Draws a cyan circle centered at (479, 63) with radius 31 then Places a cyan dot at position (90, 238).
; PLAN: r0=76(x), r1=17(y), r2=64(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=63(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x), r11=238(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 76
LDI r1, 17
LDI r2, 64
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 63
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 238
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT

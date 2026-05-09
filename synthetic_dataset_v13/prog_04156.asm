; DESCRIPTION: Composite: Creates a white circular shape at (164, 38) with radius 28 then Places a magenta 12x54 rectangle at position (234, 28) then Sets a single green pixel at (479, 26).
; PLAN: r0=164(x), r1=38(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=28(y), r7=12(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x), r11=26(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 38
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 28
LDI r7, 12
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 26
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT

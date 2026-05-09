; DESCRIPTION: Composite: Renders a white box of size 29x110 starting at (401, 34) then Draws a cyan circle centered at (322, 63) with radius 12 then Places a orange dot at position (43, 210).
; PLAN: r0=401(x), r1=34(y), r2=29(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x), r6=63(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x), r11=210(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 34
LDI r2, 29
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 63
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 210
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

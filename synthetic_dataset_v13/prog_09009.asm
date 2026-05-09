; DESCRIPTION: Composite: Creates a yellow circular shape at (82, 108) with radius 70 then Renders a orange box of size 105x89 starting at (161, 28) then Places a green dot at position (31, 49).
; PLAN: r0=82(x), r1=108(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=28(y), r7=105(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x), r11=49(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 108
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 28
LDI r7, 105
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 49
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT

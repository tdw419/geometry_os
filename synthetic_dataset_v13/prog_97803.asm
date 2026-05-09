; DESCRIPTION: Composite: Draws a cyan circle centered at (149, 110) with radius 78 then Places a orange 108x101 rectangle at position (238, 121) then Sets a single magenta pixel at (218, 36).
; PLAN: r0=149(x), r1=110(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x), r6=121(y), r7=108(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x), r11=36(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 149
LDI r1, 110
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 121
LDI r7, 108
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 36
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

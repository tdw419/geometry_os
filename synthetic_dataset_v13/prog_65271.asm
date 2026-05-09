; DESCRIPTION: Composite: Creates a cyan circular shape at (471, 156) with radius 41 then Places a yellow 58x78 rectangle at position (451, 146) then Sets a single orange pixel at (138, 146).
; PLAN: r0=471(x), r1=156(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=146(y), r7=58(width), r8=78(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=138(x), r11=146(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 471
LDI r1, 156
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 146
LDI r7, 58
LDI r8, 78
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 146
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

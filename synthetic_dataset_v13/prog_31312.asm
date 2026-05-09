; DESCRIPTION: Composite: Draws a red circle centered at (86, 76) with radius 17 then Places a black 78x38 rectangle at position (167, 207) then Sets a single orange pixel at (298, 161).
; PLAN: r0=86(x), r1=76(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=207(y), r7=78(width), r8=38(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=298(x), r11=161(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 86
LDI r1, 76
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 207
LDI r7, 78
LDI r8, 38
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 161
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

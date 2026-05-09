; DESCRIPTION: Composite: Draws a cyan rectangle at (187, 102) with width 32 and height 79 then Places a cyan circle of radius 27 at center (234, 189) then Places a orange dot at position (104, 110).
; PLAN: r0=187(x), r1=102(y), r2=32(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=189(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=110(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 187
LDI r1, 102
LDI r2, 32
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 189
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 110
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

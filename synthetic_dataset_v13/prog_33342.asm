; DESCRIPTION: Composite: Places a black 26x56 rectangle at position (72, 109) then Draws a cyan circle centered at (363, 121) with radius 73 then Places a magenta dot at position (187, 105).
; PLAN: r0=72(x), r1=109(y), r2=26(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=121(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=105(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 109
LDI r2, 26
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 121
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 105
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

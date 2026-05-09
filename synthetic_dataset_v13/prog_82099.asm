; DESCRIPTION: Composite: Places a yellow 77x114 rectangle at position (305, 22) then Draws a cyan circle centered at (345, 199) with radius 49 then Places a black dot at position (325, 31).
; PLAN: r0=305(x), r1=22(y), r2=77(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=199(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=325(x), r11=31(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 22
LDI r2, 77
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 199
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 325
LDI r11, 31
LDI r12, 0x000000
PSET r10, r11, r12
HALT

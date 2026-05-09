; DESCRIPTION: Composite: Places a orange 86x48 rectangle at position (187, 192) then Places a green circle of radius 45 at center (449, 191) then Sets a single black pixel at (69, 252).
; PLAN: r0=187(x), r1=192(y), r2=86(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x), r6=191(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x), r11=252(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 187
LDI r1, 192
LDI r2, 86
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 191
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 252
LDI r12, 0x000000
PSET r10, r11, r12
HALT

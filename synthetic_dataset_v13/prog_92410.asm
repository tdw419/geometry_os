; DESCRIPTION: Composite: Creates a magenta circular shape at (178, 145) with radius 69 then Places a cyan 62x106 rectangle at position (317, 32) then Sets a single yellow pixel at (383, 69).
; PLAN: r0=178(x), r1=145(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=32(y), r7=62(width), r8=106(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x), r11=69(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 145
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 32
LDI r7, 62
LDI r8, 106
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 69
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

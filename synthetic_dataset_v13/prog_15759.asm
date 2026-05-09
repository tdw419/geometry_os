; DESCRIPTION: Composite: Places a cyan 23x106 rectangle at position (31, 143) then Draws a magenta circle centered at (383, 179) with radius 68 then Sets a single purple pixel at (247, 47).
; PLAN: r0=31(x), r1=143(y), r2=23(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=179(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=247(x), r11=47(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 143
LDI r2, 23
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 179
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 247
LDI r11, 47
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT

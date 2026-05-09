; DESCRIPTION: Composite: Places a magenta circle of radius 77 at center (222, 109) then Places a yellow 30x108 rectangle at position (182, 137) then Sets a single purple pixel at (204, 151).
; PLAN: r0=222(x), r1=109(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=137(y), r7=30(width), r8=108(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=204(x), r11=151(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 109
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 137
LDI r7, 30
LDI r8, 108
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 151
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT

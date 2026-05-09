; DESCRIPTION: Composite: Sets a single blue pixel at (291, 218) then Places a cyan 74x94 rectangle at position (95, 49) then Places a orange circle of radius 59 at center (256, 125).
; PLAN: r0=291(x), r1=218(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=49(y), r7=74(width), r8=94(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=125(y), r12=59(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 218
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 95
LDI r6, 49
LDI r7, 74
LDI r8, 94
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 125
LDI r12, 59
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

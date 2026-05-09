; DESCRIPTION: Composite: Sets a single orange pixel at (459, 24) then Places a red circle of radius 62 at center (97, 126) then Places a yellow 62x20 rectangle at position (295, 95).
; PLAN: r0=459(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=126(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x), r11=95(y), r12=62(width), r13=20(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 97
LDI r6, 126
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 95
LDI r12, 62
LDI r13, 20
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

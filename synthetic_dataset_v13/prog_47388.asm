; DESCRIPTION: Composite: Renders a red box of size 32x115 starting at (184, 70) then Creates a black circular shape at (135, 113) with radius 62 then Places a cyan dot at position (467, 251).
; PLAN: r0=184(x), r1=70(y), r2=32(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x), r6=113(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=467(x), r11=251(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 70
LDI r2, 32
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 113
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 467
LDI r11, 251
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT

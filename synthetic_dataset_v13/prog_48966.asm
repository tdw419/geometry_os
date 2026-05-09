; DESCRIPTION: Composite: Draws a white circle centered at (320, 94) with radius 14 then Places a green 70x100 rectangle at position (245, 4) then Sets a single blue pixel at (132, 238).
; PLAN: r0=320(x), r1=94(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=4(y), r7=70(width), r8=100(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x), r11=238(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 320
LDI r1, 94
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 4
LDI r7, 70
LDI r8, 100
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 238
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

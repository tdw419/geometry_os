; DESCRIPTION: Composite: Creates a white rectangular region at (346, 9) spanning 98 by 53 pixels then Draws a cyan circle centered at (64, 108) with radius 54 then Places a white dot at position (288, 218).
; PLAN: r0=346(x), r1=9(y), r2=98(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x), r6=108(y), r7=54(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=288(x), r11=218(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 9
LDI r2, 98
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 108
LDI r7, 54
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 288
LDI r11, 218
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT

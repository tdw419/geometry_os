; DESCRIPTION: Composite: Places a orange 95x24 rectangle at position (290, 180) then Draws a red circle centered at (447, 84) with radius 64 then Sets a single blue pixel at (332, 218).
; PLAN: r0=290(x), r1=180(y), r2=95(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=84(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x), r11=218(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 180
LDI r2, 95
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 84
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 218
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

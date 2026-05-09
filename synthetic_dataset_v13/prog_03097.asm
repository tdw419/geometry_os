; DESCRIPTION: Composite: Draws a cyan circle centered at (334, 23) with radius 18 then Draws a orange rectangle at (360, 125) with width 63 and height 111 then Sets a single red pixel at (321, 73).
; PLAN: r0=334(x), r1=23(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=125(y), r7=63(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=321(x), r11=73(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 334
LDI r1, 23
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 125
LDI r7, 63
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 73
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

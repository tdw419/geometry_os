; DESCRIPTION: Composite: Draws a orange circle centered at (127, 235) with radius 10 then Draws a magenta rectangle at (174, 52) with width 50 and height 65 then Sets a single cyan pixel at (436, 141).
; PLAN: r0=127(x), r1=235(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=52(y), r7=50(width), r8=65(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=436(x), r11=141(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 127
LDI r1, 235
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 52
LDI r7, 50
LDI r8, 65
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 141
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT

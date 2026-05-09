; DESCRIPTION: Composite: Draws a magenta circle centered at (324, 37) with radius 25 then Creates a cyan rectangular region at (119, 52) spanning 63 by 97 pixels then Places a green dot at position (156, 72).
; PLAN: r0=324(x), r1=37(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=52(y), r7=63(width), r8=97(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=72(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 324
LDI r1, 37
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 52
LDI r7, 63
LDI r8, 97
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 72
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
